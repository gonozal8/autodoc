# Autodoc Server

The Autodoc server is a minimal example implementation of a data gathering web service for Autodoc.
It is implemented using Python and the Flask framework for web requests.

It is mainly designed for demonstration purposes. It is not ready for production use.

## Features

The server will listen for HTTP-based data uploads from running Autodoc agents.

The server will accept HTTP PUT and POST requests only.  
It does *not* provide access to uploaded data (e.g. browsing with HTTP GET requests).  
It does *not* provide any means to DELETE data via request nor any automated data expiration or removal.
It does *not* provide any means of access control.

However, uploaded data will be available on the server host in a normal directory tree.  
You can easily browse the information using a local file explorer or a local web browser running on the server host (`file:///srv/autodoc`).

It is trivial to allow web-based data access using any web server (e.g. Apache, Nginx, Caddy,...) or even a minimal Python web server for testing.
Caveat: 

```
$ cd /srv/autodoc; python -m SimpleHTTPServer
```

## Usage

```
$ autodoc-server -p 80 -d /srv/autodoc -x
```

## Security Considerations

Autodoc data may contain sensitive information. You should consider implementing an access-control before providing access to gathered Autodoc information, esp. for remote/network access.

Autodoc server does NOT have any builtin access control mechanism. This is NOT considered a security issue:
* Data upload is a write-only operation. No sensitive data will be leaked to unauthorized clients.
* An unauthorized user might be able to...
  * flood the server with Autodoc uploads and cause "out of disk space" situations. You should consider a data retention and removal policy for uploads (e.g. keeping only a certain amount of data for any given host)
  * upload forged data.
* A client host is NOT able to use a forged identity uploading data in the name of another host: There is no client identification string or name being processed. Instead, the server uses the client IP address as an "index" for storing data. (Thusly, you cannot simply upload a dataset pretending to be another host unless you're capable of performing IP forgery within the network.)
Protecting against IP forgery is considered out of scope for the time being.

## Alternatives

For data reception, you can use any web service capable of accepting binary data via HTTP PUT/POST requests and storing and processing them to your liking.
