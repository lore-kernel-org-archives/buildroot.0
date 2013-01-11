From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jan 2013 11:02:31 +0100
Subject: [Buildroot] [PATCH] configs: add RaspberryPi defconfig
In-Reply-To: <1357898125-29197-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1357898125-29197-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20130111110231.3846ab95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Fri, 11 Jan 2013 10:55:25 +0100, Maxime Hadjinlian wrote:
> This is a default configuration for the RaspberryPi, tested and
> functionnal.
> 
> The kernel used is the one developped by the RaspberryPi foundation
> as it's not supported currently in mainline kernel.

Technically speaking, there is a beginning of support in mainline for
the RasberryPi. But very few peripherals are supported as of today, so
I agree that a Buildroot defconfig for RasberryPi should use the
out-of-tree kernel for now.

> The configuration used for the kernel is the default bcmrpi.
> 
> Note that the kernel generated is a zImage but it must be renamed to
> kernel.img to work.

Could you add a board/rasberrypi/README.txt that explains a few things
like how the different images in output/images/ should be layed out in
a SD card, that the kernel image needs to be renamed, etc. If a good
online resource is available, you can just put a link to it.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
