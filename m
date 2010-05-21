From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 21 May 2010 15:43:56 +0200
Subject: [Buildroot] building libglib2
Message-ID: <3D6F80E6910D4096A4905780E1A2E63E@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
I checked the staging dir :
 
in my 0.9.30.3 build there is a staging/lib/libresolv.so.0
 
under my build with uclibc 0.9.31 there is no such library
 
So that seems to be the reason for the failing libglib2 build.
 
So i checked uclibc's makefile.in (line 40):
 
There seems tio be a conditional  in the 0.9.31 version  
i am no expert in makefiles, but i think there is smoke here..
 
Johan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100521/0d5e50e6/attachment.html>
