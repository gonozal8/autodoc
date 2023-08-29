# Autodoc

Automated generation of host documentation.

Christian Peter, 2023

Autodoc will automatically collect all available information about the local host including hardware, software, runtime information and configuration.

Data can be stored in a local directory, a reachable network path or uploaded to an archive server via HTTP(S).

This project includes the data collection agent ("autodoc") as well as a minimal example implementation of a data archive service ("autodoc-server"), see SERVER.md

## Use Cases

1. System Documentation

Autodoc can be used to reduce the manual effort of writing system documentation and keeping it up to date.  
Be aware that by its nature, Autodoc can only help to document *how* a system is configured. It cannot answer the question *why* it is configured that way. A full-fledged system documentation will also require some *procedures* for typical system administration tasks including error handling. These parts are out of scope for the Autodoc system.

2. System Status Information

Autodoc can also be used to gather system status information on a regular basis.  
It might be a component of a system monitoring solution. It could also be used as a source of information when debugging system issues. By comparing several Autodoc snapshots, you'll be able to find modifications in configuration files or system status.

Note that Autodoc is not designed to replace a classical system or service monitoring solution. It cannot measure and record metrics in a dedicated database either.

## Usage

see also `autodoc -h`

```
lorem ipsum
```

### Examples


## Configuration

Autodoc knows three different types of input:
* files
* directories
* executables

Files will be copied to the archive as they are. Both access permissions and timestamps will be retained.  
Directories will be converted to a zipped archive and put into the archive. Access permissions and timestamps of the contained files will be preserved, as well.  
Executables will executed, the resulting output (both stdout and stderr) will be archived.

Directives will be processed line by line.

The config file MAY contain blank lines.  
The config file MAY contain comments indicated by a "#" at the beginning of the line.

Autodoc will IGNORE *missing* files, directories and executables. There will be no documented information about these objects and their absence.
Autodoc will LOG information about *failed* commands, including their exit code and stdout/stderr output.

Note: Some tools might need super-user permissions to run or in order to show all available information. In that case, start the line with `/usr/bin/sudo ...`.
At the moment, there's no other way to obtain super-user privileges, if the data collector has not been started as "root".

```
# Autodoc example configuration

# document file content
/etc/passwd

# document command output
/usr/bin/dpkg -l

# document directory content
/etc/yum.repos.d/
```

### Security Considerations

The configuration file contains (shell) commands to be executed during the autodoc process. Do not allow any unauthorized user to tamper with the file. It could lead to involuntary information disclosure or data manipulation.

## Archive Handling

You'll probably want to automate the handling of Autodoc archives.
It will help you to keep a record of historic Autodoc information for a given machine.

### Retention

You might want to use a tool like "rsnapshot" (https://rsnapshot.org/) to setup data retention/incremental snapshots of your Autodoc directory.  
rsnapshot will create timed snapshots (e.g. hourly, daily, weekly). It can deduplicate identical files, reducing the disk usage.
Of course, you can adjust the schedule for your intended autodoc use case.
e.g. for system configuration documentation: 7 daily, 4 weekly, 12 monthly, 5 yearly
snapshots
If you need additional granularity for system status information, you might
add 24 hourly snapshots. 

### Deletion

Caveat: The following examples heavily depend on the configuration of your services and your directory setup. Double-check all removal operations. You don't want to delete your root directory....!

```
# delete all archives and extraction directories seven days after creation
find /var/tmp/autodocs -maxdepth 2 -mtime +7 -exec rm -rf {} \;
```
