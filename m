From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 22:12:56 +0100
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: use the new
 BeagleBoard/BeagleBone kernel repository
In-Reply-To: <20191102223839.16262-3-unixmania@gmail.com>
References: <20191102223839.16262-1-unixmania@gmail.com>
 <20191102223839.16262-3-unixmania@gmail.com>
Message-ID: <20191108221256.089bfa50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter, who contributed the beagleboneai defconfig.

On Sat,  2 Nov 2019 19:38:39 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> The original source URL (http://beagleboard.org/source) now redirects to
> https://elinux.org/Beagleboard:BeagleBoneBlack_Rebuilding_Software_Image
> which points to an official kernel repository at GitHub.
> 
> There are updated RT and non-RT kernel source trees. Use the last non-RT
> release (4.19.73-ti-r29) and the omap2plus defconfig.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

I've applied to next... but after doing, I realized that you could have
used the github macro, like we do in beagleboneai_defconfig. Could you
send a patch for that ?

Also, it would be nice if we could align beagleboneai, beaglebone and
beaglebone_qt5 to use the same U-Boot/Linux versions, if possible. I
see that the beagleboneai is using 4.14 even though it's a much newer
platform than beaglebone.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
