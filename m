From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 12:55:20 +0200
Subject: [Buildroot] [PATCH] package/gcc: Backport code generation fix
 for ARC700
In-Reply-To: <20180712111349.15162-1-abrodkin@synopsys.com>
References: <20180712111349.15162-1-abrodkin@synopsys.com>
Message-ID: <20180717125520.3088c6e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Jul 2018 14:13:49 +0300, Alexey Brodkin wrote:
> Fixes assembler failure when compiling for ARC700 only:
> ------------------------>8---------------------  
> {standard input}: Assembler messages:
> {standard input}:213: Error: operand out of range (128 is not between -128 and 127)
> make[2]: *** [scripts/Makefile.build:317: net/ipv4/xfrm4_mode_tunnel.o] Error 1
> ------------------------>8---------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
