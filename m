From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 15:11:26 +0200
Subject: [Buildroot] package/linux/Makefile.in does not include 'openswan'
	patches
Message-ID: <1185196286.21840.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Kernel Headers buildscript applies the openswan patches 
on top of the kernel headers, but the target/linux/Makefile.in does not.

Isn't this a bug?

Best Regards
Ulf Samuelsson
