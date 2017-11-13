From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 13 Nov 2017 22:51:45 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113145215.vc3ip3kxuawcpogx@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113145215.vc3ip3kxuawcpogx@sapphire.tkos.co.il>
Message-ID: <20171113195145.oiv7psm4w3hzmcou@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +BR2_TARGET_ARMADA_FIRMWARE=y
> > +BR2_TARGET_ARMADA_FIRMWARE_IMAGE="mrvl_scp_bl2_8040.img"
> > +BR2_TARGET_ARMADA_FIRMWARE_VERSION="binaries-marvell-armada-17.10"
> 
> It turns out that this firmware is not required, at least for the mainline 
> kernel. The system boots just fine without it. It might be needed for the 
> Marvell provided kernel. I didn't check that.

Thanks for checking! I followed BSP HOWTO at http://wiki.macchiatobin.net.
But it looks slightly outdated since it refers to 17.06 versions for all
the repositories. I will check both mainline and vendor BSPs to clarify
whether it is needed at all.

Regards,
Sergey
