From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 16:06:52 +0100
Subject: [Buildroot] Libcurl : to depend or not to depend ?
Message-ID: <8E5E9D7D337A4C58AD26215008FACEF4@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi
 
After my issue last week with libcurl it seems that libcurl uses openssl if it has been found. (if it was build before libcurl)
If its not found then libcurl simply has no SSL support.
So libcurl is'nt really dependend of openssl.
It may be better i think to have an option in the config to enable/disable ssl for libcurl.
In case ssl is enabled then libcurl should be made dependend of openssl.
 

Sagaert Johan
