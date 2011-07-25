From: andrew Parker <andparker01@hotmail.com>
Date: Mon, 25 Jul 2011 13:39:35 +0200
Subject: [Buildroot] dbg problem with threads
Message-ID: <BAY148-W188B7918A758222B68A18DBA330@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

 

I?m unable to
debug with threads under the Buildroot-2010.11.

 

I tried
dozens of combinations, but I get always errors when I try to debug.

 

Obviously
the next options are always activated in the configuration files:

 

Menuconfig:

-        
Thread
library debbuging

-        
Build
gdb debugger for the Target

-        
Build
gdb server for the Target

-        
Build
gdb for the host

 

Uclibc-menuconfig:

-        
Build
pthreads debugging support

-        
Build
uClibc with debugging symbols

 

The target
is i386

The gcc
version is 4.3.6

The gdb
version is  6.8

The uClibc
is 0.9.31

 

I tried
also with newest Buildroot release, with the same result.

 

The gdb
always says the same:

 

? cannot
initialize thread debugging library: generic error?

 

And other
data is that the when the gdb starts, the line ?This GDB was configured as:?.?
does not have any mention to the thread library.

 

In the /lib
folder I have:

 

libpthread-0.9.31.so


libthread_db-0.9.31.so

 

Any knows
any trick for this?

 

Thanks.

  		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110725/bea587e4/attachment-0001.html>
