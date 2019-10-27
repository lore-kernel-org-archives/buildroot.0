From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:24:45 +0100
Subject: [Buildroot] [PATCH 0/9] post-build: pass an empty rootpath to
 genimage
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191027122445.03df7af0@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 21:22:23 -0300
unixmania at gmail.com wrote:

> Carlos Santos (9):
>   support/scripts/genimage.sh: pass an empty rootpath to genimage
>   configs/beagleboardx15: drop custom post-image script
>   configs/beaglebone: don't use custom post-image script
>   configs/minnowboard_max-graphical: don't use custom post-image script
>   configs/minnowboard_max: drop custom post-image script
>   configs/pandaboard: drop custom post-image script
>   board/raspberrypi/post-image.sh: pass an empty rootpath to genimage
>   configs/roseapplepi: drop custom post-image script
>   configs/wandboard: drop custom post-image script

All applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
