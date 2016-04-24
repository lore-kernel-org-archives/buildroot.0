From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 10:04:07 +0200
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <20160423212646.5e6d8f52@free-electrons.com>
References: <CAGm1_kv4ipig0JpHxiBDV7b0roUrY_7sr0To=iNJuNYR_YhtcA@mail.gmail.com>
 <20160420164216.GA26814@smipidev>
 <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
 <20160421132905.7c271814@free-electrons.com>
 <20160423130141.GB10355@smipidev>
 <20160423151129.479c5f03@free-electrons.com>
 <CAPho-_Kvdg37hhfujbg99BVwhP+jPcwnsZUH2=3G7qt0CVz7yw@mail.gmail.com>
 <20160423165013.10739b58@free-electrons.com>
 <20160423161844.GA9825@smipidev>
 <20160423212646.5e6d8f52@free-electrons.com>
Message-ID: <20160424080407.GB3082@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 23, 2016 at 09:26:46PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 23 Apr 2016 18:18:44 +0200, Pieter Smith wrote:
> 
> > > Well, what you want and what the Buildroot maintainer/core developers
> > > want may be different :-)
> > 
> > Yup... If all the world was of one mind, it surely would be a boring place ;-)
> 
> Indeed :)
> 
> > I do not want to try to force the beaglebone_barebox_defconfig. Everybody knows
> > that it doesn't work that way. Is there no value in having SOME FORM of
> > defconfig to illustrate feature use in buildroot?
> 
> There is a value, but not as a defconfig in configs/ IMO.
> Unfortunately, the place/infrastructure where it would have a value
> doesn't really exist today.

I will post the patch series including the beaglebone_barebox_defconfig. This
will at least illustrate usage, even if it only lives in the mailing archives.
Should it be required: The buildroot maintainers have my permission to merge
only a sub-set of the patch-series. I do not object to this, and I will make it
clear in the summary.

> > > My opinion is that there is no point is having gazillions of different
> > > defconfigs for the same board. Your focus is on Barebox, but then the
> > > next developer will want a defconfig for BeagleBone+Qt5, the next one
> > > for BeagleBone+Wayland, the next one for BeagleBone+Kodi, the next one
> > > for BeagleBone as a toaster controller, etc, etc. As you can see, it's
> > > going to be an endless list of unmaintainable defconfigs, so we have to
> > > cut the line somewhere.
> > 
> > What? No beaglebone_epilator_defconfig? Pity... ;-)
> 
> beaglebone_toothbrush_defconfig :-)

beaglebone_commodore64_emulator_defconfig?

> > > It would however be useful in a "testing" framework so that we can
> > > validate automatically that the dual Barebox functionality continues to
> > > work over time.
> > 
> > Agreed. Where can I stall my shiny BBB barebox "regression test" roadster then?
> 
> My grand plan is to promote something like
> https://github.com/tpetazzoni/buildroot-runtime-test in order to
> collect test cases (both build-time tests and runtime tests).

Promising. I will remember to have a look at it in a few weeks.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

- Pieter
