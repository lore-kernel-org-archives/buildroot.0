From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:48:36 +0200
Subject: [Buildroot] [PATCH 0/9] package/libselinux: kernel munging
 fixups
In-Reply-To: <20200731204100.1171427-1-aduskett@gmail.com>
References: <20200731204100.1171427-1-aduskett@gmail.com>
Message-ID: <20200904154836.4b329d86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Jul 2020 13:40:51 -0700
aduskett at gmail.com wrote:

> Adam Duskett (9):
>   package/libselinux: set the config_lsm kernel config option to selinux
>   package/libselinux: enable kernel selinux support for erofs images
>   package/libselinux: enable kernel selinux support for ext2 images
>   package/libselinux: enable kernel selinux support for ext3 images
>   package/libselinux: enable kernel selinux support for ext4 images
>   package/libselinux: enable kernel selinux support for f2fs images
>   package/libselinux: enable kernel selinux support for jffs2 images
>   package/libselinux: enable kernel selinux support for squashfs images
>   package/libselinux: enable kernel selinux support for ubifs images

I don't see those patches anymore in patchwork, I'm not sure why. Did
you change their status?

Anyway, I've applied the entire series. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
