From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 16 Nov 2007 20:03:31 +0200
Subject: [Buildroot] [Re: Re:  Alsa problem with arm 2.6.23.1 and uclibc]
Message-ID: <473DDB73.6030700@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have linux-2.6.22.10 headers but kernel is built by hands
different versions 2.6.18, 2.6.21, 2.6.23

>>> ioctl(4, USBDEVFS_CONTROL, 0xbef809cc)  = 0
>>> ioctl(4, UI_DEV_CREATE, 0xbef80ab0)     = 0
>>> ioctl(4, USBDEVFS_CONNECTINFO, 0xbef80634) = 0
>>> ioctl(4, USBDEVFS_HUB_PORTINFO, 0xbef80748) = -1 ENOTTY (Inappropriate
>>> ioctl for device)
