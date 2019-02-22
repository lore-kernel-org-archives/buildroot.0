From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:17:13 +0100
Subject: [Buildroot] U-Boot update needed in imx23evk_defconfig
In-Reply-To: <CAOMZO5Ceka8LQQr76UVScyTXNB8DemsRZ3UQQg8aYc5N4pwNBQ@mail.gmail.com>
References: <20190208124718.650e4d42@windsurf>
 <CAOMZO5Ceka8LQQr76UVScyTXNB8DemsRZ3UQQg8aYc5N4pwNBQ@mail.gmail.com>
Message-ID: <20190222221713.4d05d16f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Fri, 8 Feb 2019 10:12:35 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> > This is due to the bump of OpenSSL to 1.1.x. This issue seems to have
> > been fixed in U-Boot commit 7bae13b7579a6bc42330427496330fe2a29cbd56,
> > which is part of U-Boot since 2017.01, but the defconfig is using
> > 2016.09.
> >
> > Do you think you could update U-Boot in this defconfig to at least
> > 2017.01 ?  
> 
> Yes, I will prepare a patch that updates U-Boot for this board.
> 
> After testing on the board I will submit it to the list next week.

Do you have some news about the imx23evk U-Boot version bump ? It is
still failing to build on current master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
