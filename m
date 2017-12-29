From: daggs <daggs@gmx.com>
Date: Fri, 29 Dec 2017 15:02:09 +0100
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based
 rootfs creation
In-Reply-To: <20171229135505.GC3176@scaer>
References: <20171229130604.9897-1-daggs@gmx.com> <20171229135505.GC3176@scaer>
Message-ID: <trinity-2aa383e1-8eee-4a89-98ae-12ca888303e5-1514556129476@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Yann.

> Sent: Friday, December 29, 2017 at 3:55 PM
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] tvheadend: add dependency on udev based rootfs creation
>
> Dagg, All,
> 
> On 2017-12-29 15:06 +0200, Dagg Stompler spake thusly:
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is needed for tvheadend inorder
> > for the program to see usb based DVB cards.
> 
> But is it required for other types of cards, like PCI ones?
I don't know, I have an usb adapter on hand, not pci one.

> 
> And what about systems using mdev instead? I've had a system sithout
> udev at all, and tvheadend was working perfectly fine for me.
tried mdev, didn't worked.

> 
> Basically, I don't think we want to add this dependency at all, because
> it is not required in my experience.
without that feature, I'm unable to use tvheadend, maybe it is needed only for usb adapters.
maybe it is a new feature, also, I won't be surprised if it is needed but not checked if the devs take into account that all distros use some from of udev.
I've asked at the tvheadend irc channel but no answer yet.

Dagg.
