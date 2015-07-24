From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Date: Fri, 24 Jul 2015 15:50:30 +0200 (CEST)
Subject: [Buildroot] [PATCH v6 1/1] rtl8821au: new package
In-Reply-To: <1437691280-23926-1-git-send-email-christian@paral.in>
References: <1437691280-23926-1-git-send-email-christian@paral.in>
Message-ID: <alpine.LNX.2.00.1507241546220.30794@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,  

Note : I'm new on the list, so I had insert this tread by hand !

I'm the one working on the RTL8821AU driver.

On Thu, 23 Jul 2015, Christian Stewart wrote:

> Adding a kernel module based USB wifi driver. There is no official
> version of this driver that works properly on ARM and with newer USB
> WiFi cards. This driver version builds module 8821au and is based on a
> kernel module release from ASUS with various fixes integrated in.

This message will be commited please change.

The I think the difference between the version from ASUS and mine based
the one Edimax are in the handling of the LED.
Maybe there are more ...

> I've switched to use ulli-kroll's branch of rtl8821au. While it's based
> on an older vendor version, it has binary firmware and around ~1800
> commits of work to improve the driver. I think this work is probably
> more valuable than the vendor's updates.
> 

-> git send-email --compose
Will add some message an intreductory message

> --- /dev/null
> +++ b/package/rtl8821au/0001-disable-default-debug.patch

I do add some kind of "disable debug message"
This will take some time, I'm currently working in the code.

> +config BR2_PACKAGE_RTL8821AU
> +     bool "rtl8821au"
> +     depends on BR2_LINUX_KERNEL
> +     help
> +       rtl8821au wifi driver
> +
> +       https://github.com/paralin/rtl8821au

Please fix this URL !

Maybe add some line "out of tree driver"
And the USB3 issue I found inthe HW as you can read in
Readme.md

Greetings from Cologne
Hans Ulli Kroll
