From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Oct 2010 10:38:28 +0200
Subject: [Buildroot] GPIO
In-Reply-To: <SNT119-W45EBAC8F8EBBF3D046BA77825D0@phx.gbl>
References: <SNT119-W45EBAC8F8EBBF3D046BA77825D0@phx.gbl>
Message-ID: <20101021083828.GC13930@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johnny,

On Thu, Oct 21, 2010 at 08:29:13AM +0000, Johnny Beardsmore wrote:
> I product I worked on a while ago has returned to haunt me.
> 
> Essentially, I need support for a GPIO port on a pc-104.  I've perused the 
> configuration settings in Buioldroot, but wasn't able to spot anything that 
> looked suitable.  Is it, and has anyone any experience with doing so?

If you have a recent enough Linux kernel, and a driver supporting gpiolib for 
your GPIO port, then you can use the sysfs based interface for controlling 
GPIO lines. See Documentation/gpio.txt in the Linux kernel sources.

For a list of GPIO drivers in your kernel see drivers/gpio/Kconfig.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
