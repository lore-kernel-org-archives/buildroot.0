From: Thomas Lundquist <lists@zelow.no>
Date: Sat, 16 Feb 2008 13:23:37 +0100
Subject: [Buildroot] BUILD_DIR vs TOOL_BUILD_DIR
Message-ID: <20080216122337.GA26810@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am working on some more lzma stuff (squashfs right now) and the
squashfs.mk builds the host tools in BUILD_DIR. getext2fs and makedevs 
also does this and I am sure I can find more of'em.

This is not pretty, BUILD_DIR should be for TARGET_DIR - stuff and
TOOL_BUILD_DIR for staging / host tools.

Does anyone disagree? if not I will fix this as I see them.


Thomas.
