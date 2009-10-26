From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 27 Oct 2009 00:45:30 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) ubuntu / debian
	shells
Message-ID: <3C52A17850404A5A90AE41DF6FCA5AE2@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I checked my debian 5 and my ubuntu 8.10  for their shell :
 
Both have the same bash version :  /bin/bash --version  shows version
3.2.39(1)-release ......
 
Both machines have SHELL=/bin/bash in the environment vars.
 
BUT : on my debian /bin/sh  is a sl to /bin/bash
 
on the UBUNTU 8.10  /bin/sh is a sl to /bin/dash !!
 
just wondering why the env.. var is pointing to /bin/bash ?
 
I changed the softlink on my UBUNTU to point to /bin/bash  and all builds
are perfect now !!!
 
Lesson learned : get rid of dash  :)
 
This was a nasty one.
 
Johan
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091027/1b41163c/attachment.htm>
