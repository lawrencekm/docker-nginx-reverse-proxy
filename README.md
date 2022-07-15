I believe Nginx dont take in account Docker resolver (127.0.0.11), so please, can you try adding:

resolver 127.0.0.11
in your nginx configuration file?

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