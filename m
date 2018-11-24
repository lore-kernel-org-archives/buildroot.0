From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 22:44:32 +0100
Subject: [Buildroot] Status of gdb/gdbserver support for RISC-V 64 ?
Message-ID: <20181124224432.2f3721f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

I'm curious to know what is the status of RISC-V 64 support in
gdb/gdbserver ?

Just tried building gdbserver with gdb 8.1.1, and it says:

  Error: target not supported by gdbserver.

Is the support on its way upstream ? We probably need to add a few more
dependencies in package/gdb/Config.in.host to prevent people from
trying to build gdb versions that don't have RISC-V 64 support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
