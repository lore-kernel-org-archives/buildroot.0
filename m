From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: remove support for
	at91sam9260pf
Message-ID: <20101217160202.9C9A88E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27940e88b7eca32e11befba998b530f4f86aaece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was supposed to be the support for AT91SAM9260 using a parallel flash
(instead of the usual dataflash). But the provided U-Boot configuration
at91sam9260pf.h was not used anywhere, and it was unsufficient to add
correct support in U-Boot (some changes in U-Boot Makefile would also be
needed). Additionnally, this configuration has not been merged into U-Boot
upstream since 2007 (when it was added to Buildroot).

Therefore, let's get rid of this configuration. If some users are
interested, we can re-introduce it properly with their help.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
