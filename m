From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:06:37 +0100
Subject: [Buildroot] [PATCH 3/3] board/freescale/common/imx: Fix typo
In-Reply-To: <20181227160806.4466-3-nerv@dawncrow.de> (=?utf-8?Q?=22Andr?=
 =?utf-8?Q?=C3=A9?= Hentschel"'s
 message of "Thu, 27 Dec 2018 17:08:06 +0100")
References: <20181227160806.4466-1-nerv@dawncrow.de>
 <20181227160806.4466-3-nerv@dawncrow.de>
Message-ID: <87bm4e5d42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Committed to 2018.11.x, thanks.

> ---
 >  board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8
 > b/board/freescale/common/imx/genimage.cfg.template_imx8
 > index fdb645014a..2f8842f8e0 100644
 > --- a/board/freescale/common/imx/genimage.cfg.template_imx8
 > +++ b/board/freescale/common/imx/genimage.cfg.template_imx8
 > @@ -3,7 +3,7 @@
 >  # We mimic the .sdcard Freescale's image format:
 >  # * the SD card must have 33 kB free space at the beginning,
 >  # * U-Boot is integrated into imx8-boot-sd.bin and is dumped as is,
 > -# * a FAT partition at offset 32MB is containing Image and DTB files
 > +# * a FAT partition at offset 8MB is containing Image and DTB files
 >  # * a single root filesystem partition is required (ext2, ext3 or ext4)
 >  #
 
 > -- 
 > 2.17.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
