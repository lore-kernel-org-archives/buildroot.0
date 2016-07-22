From: mr_ada at cox.net <mr_ada@cox.net>
Date: Thu, 21 Jul 2016 19:58:01 -0700
Subject: [Buildroot] Building tarball
In-Reply-To: <Mcls1t01C2yBjFQ01cluLy>
Message-ID: <20160721225801.CPFYY.53403.imail@fed1rmwml304>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just finished build from the tarball (may 5 version) and even thought it seemed to complete and create an sdcard.img, my Pi 3 doesn't boot up.  I even hooked it to my TV (HDMI receiver) and no signal.  So I have no clue what to do next.  Did this ever work for Raspberry Pi?  Are there any other Pi people out there?

Thanks,
Chris 

PS: there were some issues I saw:
1) cc1: error: no include path in which to search for stdc-predef.h
2) bunch of warnings in dwarf2.c, server.c, libtool, expr.c, directives.c, macro.c, genhoooks.c, gt-c-c-decl.h, c-parser.c, dwarf2asm.c, final.c, function.c, gyte-desc.c, ipa-devirt.c, ipa-pure-const.c, ipa-reference.c, ipa,c, ira-color.c, ... (didn't feel like listing them after this point)

In the pi readme.txt I saw this:
Insert the SDcard into your Raspberry Pi, and power it up. Your new system should come up now and start two consoles: one on the serial port on the P1 header, one on the HDMI output where you can login using a USB keyboard.

No clue what the P1 header is and the HDMI didn't output to anything.  I do have the official display that comes with the Pi.
