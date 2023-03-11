I believe Nginx dont take in account Docker resolver (127.0.0.11), so please, can you try adding:

This is because the docker dns server does not do ipv6, but the nginx resolver queries for both ipv6 and ipv4 as of 1.5.8: http://nginx.org/en/docs/http/ngx_http_core_module.html#resolver

You can disable ipv6 easily enough on the resolver line in nginx (see the link above, it's just ipv6=off) and then it should start working for you.

Syntax:	resolver address ... [valid=time] [ipv6=on|off] [status_zone=zone];
Default:	—
Context:	http, server, location
Configures name servers used to resolve names of upstream servers into addresses, for example:

resolver 127.0.0.1 [::1]:5353;
The address can be specified as a domain name or IP address, with an optional port (1.3.1, 1.2.2). If port is not specified, the port 53 is used. Name servers are queried in a round-robin fashion.

Before version 1.1.7, only a single name server could be configured. Specifying name servers using IPv6 addresses is supported starting from versions 1.3.1 and 1.2.2.
By default, nginx will look up both IPv4 and IPv6 addresses while resolving. If looking up of IPv6 addresses is not desired, the ipv6=off parameter can be specified.

Resolving of names into IPv6 addresses is supported starting from version 1.5.8.
By default, nginx caches answers using the TTL value of a response. An optional valid parameter allows overriding it:

resolver 127.0.0.1 [::1]:5353 valid=30s;


resolver 127.0.0.11
in your nginx configuration file?
http {
    resolver 127.0.0.11 ipv6=off;
}

 several cases where I had this error, adding resolver_timeout 1s; to the Nginx config solved the issue. Most of the time I don't have a resolver entry.

Edit: what also worked for containers where I could explicitly define a nameserver: resolver DNS-IP valid=1s;


My problem was $request_uri at the end. After adding it at the end of uri and changing the 127.0.0.1 to 127.0.0.11 solved my issue. I hope it will help people to not spend hours on this.

location /products {
            resolver 127.0.0.11;
            proxy_pass http://products:3000$request_uri;
            }



            ofcourse add these records to  your hosts file of the server or loocal computer to allow connections via these domain names into this server

            //
            - 127.0.0.1 domain1.com
            - 127.0.0.1 domain2.com