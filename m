From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 24 Mar 2016 10:01:24 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: unify and update
 defconfig for Xplained boards
In-Reply-To: <20160324085406.GE12245@odux.rfo.atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <20160324094006.172567ac@free-electrons.com>
 <20160324084344.GD12245@odux.rfo.atmel.com>
 <20160324094655.007db654@free-electrons.com>
 <20160324085406.GE12245@odux.rfo.atmel.com>
Message-ID: <20160324090124.GH2570@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/2016 at 09:54:06 +0100, Ludovic Desroches wrote :
> > > > > - use bootstrap as first stage bootloader
> > > > 
> > > > As opposed to? Did you mean at91bootstrap3 rather than "bootstrap"?
> > > 
> > > As opposed to u-boot spl which is less tested than at91bootstrap3.
> > 
> > OK. I think Alex has a somewhat different opinion on the matter, but I
> > guess that if the vendor recommends to use at91bootstrap3, we should
> > use this solution in our defconfig.
> > 
> 
> I know he doesn't share the same opinion. At the moment u-boot spl is not
> working on SAMA5D2. Moreover, latest enhancements for at91bootstrap are
> probably not ported to u-boot spl.
> 

Still, the configs I submitted were using at91bootstrap ;) The one using
u-boot spl was initially from Ryan Barnett.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
