From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Dec 2008 11:54:04 +0100
Subject: [Buildroot] Guys really need help here! :build Buildroot image
 error
In-Reply-To: <20830292.post@talk.nabble.com>
References: <20830292.post@talk.nabble.com>
Message-ID: <20081204115404.62dbe2d4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 4 Dec 2008 01:52:15 -0800 (PST),
alberteerj <albertrj01@yahoo.com> a ?crit :

> $ svn co http://svn.gumstix.com/gumstix-buildroot/trunk

This is not the official Buildroot we are shipping. Please ask support
to the Gumstix people, or tell them to get their changes included in
the official Buildroot version.

> make -j3 BR2_TARGET_GUMSTIX_BASIXCONNEX=y GUMSTIX_400MHZ=y
> SVN_REVISION=1637M ARCH=arm
> CROSS_COMPILE=/home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibcgnueabi-
> -C /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0 tools 

This is probably supposed to generate U-Boot's tools/mkimage.

> cp
> -f /home/ken/gumstix-buildroot/build_arm_nofpu/u-boot-1.2.0/tools/mkimage /home/ken/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/mkimage 

But it seems that it didn't happen.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
