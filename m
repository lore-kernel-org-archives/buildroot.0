From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 13 Aug 2007 02:21:11 +0200
Subject: [Buildroot] .Position of ".PHONY" directive
Message-ID: <1186964471.25003.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "make" info says that ".PHONY" should precede its arguments,
but it most, if not all Makefiles, they are at the bottom.

When I do "make -d" for debug, it looks like the PHONY targets
are continously recalculated.

Should we move the .PHONY statements?

Best Regards
Ulf Samuelsson
