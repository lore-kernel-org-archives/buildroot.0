From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 12 Jun 2008 15:12:22 +1000
Subject: [Buildroot] U-boot and nand flash
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB695782F9@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB695782DF@MAIL-UA.ccs.local>
	<330EC2471BF24E48B513AF1A6975EB695782F9@MAIL-UA.ccs.local>
Message-ID: <20080612051222.GC12527@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2008 at 12:46:06PM +0200, Teemu Keskinarkaus wrote:
> Forgot to add the errors u-boot is giving:
> 
> U-Boot> nand erase 0x0 0x20000
> 
> NAND erase: device 0 offset 0x0, size 0x20000
> nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
> nand_erase: start = 0x00000000, len = 131072
> nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
> Timeout!nand_erase: Failed erase, page 0x00000000
> 
> NAND 256MiB 3,3V 8-bit: MTD Erase failure: -5
> 
> OK
> U-Boot>
> 
> I couldn't find what the result -5 means.
> 
> Since this is evaluation board that (at least buildroot) is supported directly I'd though that nand handling would work too without too much hacking needed.

buildroot only integrates other partys' software. You'd have to ask the
u-boot folks for help on your NAND problem.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
