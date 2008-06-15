From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 15 Jun 2008 14:21:29 +0200
Subject: [Buildroot] AT91 patches for kb9202
References: <1213421710.6151.13.camel@kokopelli>
Message-ID: <000201c8cee4$85c2ca60$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian Beattie wrote:
> I'm reworking my patch for support for the kb9202 board and want to
> include many of the kernel patches from the Atmel directory.  The
> question I have is can I reach over into the Atmel directory, or
> should I make my own copy in KwikByte?

Use the target/device/atmel/arch-at91 directories.
If you want to add some board specific patches, then 
they should be in the board directory.

Maybe the "target/device/Atmel/arch-*" linux patches are better located in 
target/linux/arch/$(ARCH) ?
Will think about that one.


Best Regards
Ulf Samuelsson
