From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 13:37:13 +0100
Subject: [Buildroot] Board defconfigs lacking maintainers
In-Reply-To: <20180305120722.GD7096@momiji>
References: <20180304231547.7ed3f5af@windsurf.home>
 <20180305120722.GD7096@momiji>
Message-ID: <20180305133713.0232b1b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Mon, 5 Mar 2018 12:07:22 +0000, Adrian Perez de Castro wrote:

> >  - ci20_defconfig  
> 
> One if my work colleagues has a ci20 around which I *think* he has been using
> mostly with Buildroot as the base system. I'll get to him and see whether it
> may be possible for one of us to adopt this one.

Great! This defconfig was initially contributed by Vicente Olivert
Riera, but he has left Imagination Technologies, so he is no longer
working on Buildroot or MIPS.

> >  - odroidc2_defconfig  
> 
> We have at the office a couple of Odroid C2 which I think may not be in use, 
> but I do not have physical access to them (I work remotely), but I might be
> able to do something about them. I'll ask around as well.

Dagg is already working on this defconfig, is actively using the
board, and already replied that he is willing to be in the DEVELOPERS
file for this board.

> >  - raspberrypi0_defconfig
> >  - raspberrypi2_defconfig
> >  - raspberrypi3_64_defconfig
> >  - raspberrypi3_qt5we_defconfig
> >  - raspberrypi_defconfig  
> 
> I tend use the Raspberry Pi 2/3 defconfigs whenever I bump the WebKitGTK+
> package (and recently libepoxy), and they are very popular boards. It would
> be a pity to lose those. I can help out with them, but I bet there are people
> with better knowledge about the hardware details who should be listes as
> maintainers ;-)

Yeah, I'm sure the RPi defconfigs will find one or several adopters.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
