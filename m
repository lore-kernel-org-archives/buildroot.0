From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 23:07:40 +0200
Subject: [Buildroot] [PATCH v2] Add support for the Calao-systems
 USB-A9263
In-Reply-To: <4FFA7C89.4010505@calao-systems.com>
References: <4FFA7C89.4010505@calao-systems.com>
Message-ID: <20120713230740.6938b378@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 09 Jul 2012 08:39:05 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> Hi,
> Attached a new patch for the USB-A9263.

This should not be part of the commit log, as it repeats the title.

> More info at <http://www.calao-systems.com>. 
> 
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  .../usb-a9263/at91bootstrap-1.16-usb-a9263.patch   |  851 ++++++++++++++++++++
>  board/calao/usb-a9263/usb-a9263_defconfig          |  102 +++

This file should be named linux-<version>.config.

>  configs/usb_a9263_defconfig                        |   14 +

And this one should be named calao_usb_a9263_defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
