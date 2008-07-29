From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Tue, 29 Jul 2008 06:28:06 +0200
Subject: [Buildroot] C++ libraries are not installed on target
Message-ID: <330EC2471BF24E48B513AF1A6975EB695D5051@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far I have made all my programs in C and it's been working ok. The
target is Atmel AT91SAM9263ek based board. Buildroot is taken from svn
little over month ago.

 

Now I have tried to make C++ program and it compiles ok, but when I try
to run it on target, it complains about not be able to load library
'libstdc++.so.6'. I checked and it's not there, but it's on buildroot
staging_dir so it has been build, but not copied to unit's filesystem. 

 

In menuconfig I have Toolchain -> Build/install C++ compiler and
libcstdc++ checked. What else I need to get C++ libraries to be copied
to unit's filesystem?

 

I was able get program compiled/working when statically linking the
libraries, but that's not a real solution and program size went from
53kB to 888kB.

 

-Teemu

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080729/308d7efd/attachment.htm 
