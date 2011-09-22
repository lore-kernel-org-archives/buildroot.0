From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2011 20:57:59 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
 tarball, git and patch dir
In-Reply-To: <201109221920.37170.arnout@mind.be>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be>
Message-ID: <20110922205759.01de08f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Sep 2011 19:20:36 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Do people often use buildroot this way?  I always make a
> project-specific branch of the buildroot tree and drop any patches
> directly in there.

I typically make a per-project branch as well, but for kernel/u-boot
patches, I typically like to store them into

	board/<company>/<project>/linux-x.y.z-patches
	board/<company>/<project>/uboot-x.y.z-patches

because those patches are typically board and project specific.

Where do you put them ? Directly in linux/ and boot/uboot/ ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
