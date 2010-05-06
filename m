From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 6 May 2010 16:24:58 +0100
Subject: [Buildroot] Commit "Remove BR2_GNU_TARGET_SUFFIX and compute
	GNU_TARGET_NAME"
Message-ID: <i2h32a6c48b1005060824nb4df8741p655241e4ce1b0f7e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://git.buildroot.net/buildroot/commit/?id=65e80a0b0bf275e0ffdbb611706bec4b1b4719b1

This patch would seem to prevent Codesourcery toolchains from working.  They
use "arm-none-linux-gnueabi-*" (no $(LIB) part).
I suppose you can't take everyone into account but was just curious to know
if this was taken into account.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100506/e6078b97/attachment.htm>
