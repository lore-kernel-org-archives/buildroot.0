From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 29 Apr 2009 10:12:46 +0200
Subject: [Buildroot] gdb snapshot
In-Reply-To: <20090428184043.3e10c50a@surf>
References: <1240935848.19264.2.camel@sven>  <20090428184043.3e10c50a@surf>
Message-ID: <1240992766.6605.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-04-28 at 18:40 +0200, Thomas Petazzoni wrote:

> The patches in snapshot/ haven't been updated since 2006, so I would
> say that this part is unmaintained, which means that nobody uses it and
> we can probably drop it.

Ok, thanks for looking into this.

Perhaps someone can help me with the gdb problem I am facing. Whenever I
try to debug a program on the target platform (ARM EABI aapcs-linux),
the debugger gets a SIGCHLD signal and stops:

[root at proto2 /]# gdb hello
GNU gdb 6.8
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying" and "show warranty" for details.
This GDB was configured as "arm-linux-uclibcgnueabi"...
(gdb) r
Starting program: /hello 
Hello world

[1]+  Stopped(SIGCHLD)        gdb hello


Is there anything special I need to do to run gdb on the ARM platform?


Sven
