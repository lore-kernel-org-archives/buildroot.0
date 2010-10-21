From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 22 Oct 2010 00:21:24 +0200
Subject: [Buildroot] Firmware Loading
In-Reply-To: <9F13A3F8731E4CB9B825A924ACC0A6A3@RnD>
References: <9F13A3F8731E4CB9B825A924ACC0A6A3@RnD>
Message-ID: <1287699684.18536.9.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do you have BR2_PACKAGE_UDEV_FIRMWARE_SH in your .config ?

Regards,

--
Lionel Landwerlin

Le jeudi 21 octobre 2010 ? 17:03 -0400, Neal Peacock a ?crit :
> I realize this is kind of an old post but I think I'm having the same
> trouble
> with the carl9170 driver on my embedded system.  Could you post how you
> setup udev to handle the firmware loading?  I tried echoing udevd into the
> proc/sys/kernel/hotplug and all and I know I have the .sh script in place
> but nothing seems to be happening and firmware loads always time out.
> 
> Thanks.
> 
> Andrew Wiley-2 wrote:
> >
> > On Sat, Jan 16, 2010 at 7:29 AM, Michael S. Zick
> > <minimod@morethan.org>wrote:
> >>
> >> Perhaps update the mdev configuration file?
> >> It ships empty, it has to, too installation specific to pre-define
> >> anything.
> >>
> >> mdev --help
> >> will start you off; continue as required with the command descriptions -
> >> if loaded on your machine during the build or at the busybox web-site.
> >>
> >
> > Well, I wound up just going with udev, call me lazy if you like, but it
> > works for me. My board runs off a flash drive, so space isn't an issue. I
> > won't generally be adding or removing devices after startup, so
> > performance
> > isn't really an issue either, but I may wind up swapping out devices that
> > are connected at boot time, so udev seemed like a better solution for my
> > setup.
> >
> > Thanks,
> > Andrew
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> 
> 
> 
> --
> Neal Peacock
> VP of Product Development
> Coin Free LLC
> 407-657-5971
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
