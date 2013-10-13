From: =?ISO-8859-1?Q?Ciar=E1n?= Rehill <cir.vfi@gmail.com>
Date: Sun, 13 Oct 2013 21:11:34 +0100
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <525AAE63.3060601@gmail.com>
References: <525AAE63.3060601@gmail.com>
Message-ID: <1381695094.2543.10.camel@cabbage>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marco Trapanese wrote:
...
>  >>> sensoray2253 1.2.6 Building
> /usr/bin/make -j5 
> HOSTCC="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
> /usr/bin/gcc" HOSTCFLAGS="" ARCH=arm 
> INSTALL_MOD_PATH=/home/mark/dev/rpiqt5/buildroot-rpi/output/target 
> CROSS_COMPILE="/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/ccache 
> /home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/bin/arm-buildroot-linux-gnueabi-" 
> DEPMOD=/home/mark/dev/rpiqt5/buildroot-rpi/output/host/usr/sbin/depmod 
> -C /home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom 
> M=/home/mark/dev/rpiqt5/buildroot-rpi/output/build/sensoray2253-1.2.6 
> modules
> make[1]: Entering directory 
> `/home/mark/dev/rpiqt5/buildroot-rpi/output/build/linux-custom'
>    Building modules, stage 2.
>    MODPOST 0 modules

Zero modules makes me think that there's something up with your source
makefile (the one in output/build/sensoray...)  You should probably post
it.

As you say, no errors - but nothing done either.
