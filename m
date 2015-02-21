From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:27:08 +0100
Subject: [Buildroot] trouble configuring for beaglebone black and
 external Linaro toolchain, 2015.02-rc2
In-Reply-To: <CAPALihNuWHDrxf=RcinmAGcx-zchGh=--L209e__O7e+BRpT2w@mail.gmail.com>
References: <CAPALihNuWHDrxf=RcinmAGcx-zchGh=--L209e__O7e+BRpT2w@mail.gmail.com>
Message-ID: <20150221232708.19c7f576@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Welch,

On Sat, 21 Feb 2015 13:23:09 -0600, William Welch wrote:

> Thank you for all the great work you are doing in buildroot.
> 
> I first built a system using the beaglebone_defconfig, and the make went
> fine.  But when I try to select the external linaro toolchain, the make
> fails-- EABIhf selected, but toolchain is incompatible...
> 
> Steps to repeat:
> 
> make beaglebone_defconfig
> make menuconfig
>    choose external, and it will automatically choose Linraro ARM 2014.09
> make
> It will download the toolchain
> -- gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> but then fail while configuring the toolchain.
> 
> What am I missing here?

Please post the latest ~200 lines of the build output. Otherwise, we
have no idea what your failure is.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
