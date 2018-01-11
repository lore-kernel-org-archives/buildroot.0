From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 Jan 2018 08:14:13 +0100
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
References: <20180105093501.5793-1-daggs@gmx.com> <20180105225459.GC3673@scaer>
Message-ID: <5ffjiex4oj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, hi Dagg,

Am Fri, 05 Jan 2018 23:54:59 +0100 schrieb Yann E. MORIN:

> So I still believe we should not add a dependency on udev at all,
> because as far as I understand, you claim it is only needed for USB
> devices. Other devices seem to be working fine without udev, and it is
> perfectly valid to have a setup with a non-USB device and no udev.
> 
> So, still no from me...

my tvheadend server also works fine without udev, so NACK from me as well.

Regards, Bernd
