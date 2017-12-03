From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 22:22:59 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: fix alphabetic ordering
 for Sergey Matyukevich
In-Reply-To: <20171203212102.gtzvyn5h6rzxd6on@speedy.hunter>
References: <20171203202617.20560815F7@busybox.osuosl.org>
 <20171203212102.gtzvyn5h6rzxd6on@speedy.hunter>
Message-ID: <20171203222259.0a8fa158@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 00:21:02 +0300, Sergey Matyukevich wrote:

> >  N:	Sergey Matyukevich <geomatsi@gmail.com>
> > -F:	package/xr819-xradio/
> > -F:	package/armbian-firmware/
> >  F:	board/orangepi/orangepi-zero
> >  F:	board/orangepi/orangepi-one
> >  F:	board/linksprite/pcduino
> >  F:	configs/orangepi_one_defconfig
> >  F:	configs/orangepi_zero_defconfig
> >  F:	configs/linksprite_pcduino_defconfig
> > +F:	package/armbian-firmware/
> > +F:	package/xr819-xradio/
> >  
> >  N:	Sergio Prado <sergio.prado@e-labworks.com>
> >  F:	package/libgdiplus/  
> 
> Thanks for doing this. This fix was is a part of my today's
> v3 MacchiatoBin series. So it looks like the time has come for v4 :)

Please wait before doing a v4. I'm integrating your patches into a
larger series that is touching ATF. This is the reason why I committed
just this fix, as a preparation.

I will Cc you on the patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
