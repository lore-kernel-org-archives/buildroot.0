From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 11:08:59 +0200
Subject: [Buildroot] gdb snapshot
In-Reply-To: <1240992766.6605.7.camel@sven> (Sven Neumann's message of "Wed\,
	29 Apr 2009 10\:12\:46 +0200")
References: <1240935848.19264.2.camel@sven> <20090428184043.3e10c50a@surf>
	<1240992766.6605.7.camel@sven>
Message-ID: <87k553esic.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> [root at proto2 /]# gdb hello
 Sven> GNU gdb 6.8
 Sven> Copyright (C) 2008 Free Software Foundation, Inc.
 Sven> License GPLv3+: GNU GPL version 3 or later
 Sven> <http://gnu.org/licenses/gpl.html>
 Sven> This is free software: you are free to change and redistribute it.
 Sven> There is NO WARRANTY, to the extent permitted by law.  Type "show
 Sven> copying" and "show warranty" for details.
 Sven> This GDB was configured as "arm-linux-uclibcgnueabi"...
 Sven> (gdb) r
 Sven> Starting program: /hello 
 Sven> Hello world

 Sven> [1]+  Stopped(SIGCHLD)        gdb hello

 Sven> Is there anything special I need to do to run gdb on the ARM platform?

Strange, it has atleast worked in the past. Do you have the same
problem with gdbserver?

-- 
Bye, Peter Korsgaard
