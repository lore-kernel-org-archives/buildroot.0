From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 21:58:06 +0100
Subject: [Buildroot] [PATCH] package/fswebcam: bump to latest git version
In-Reply-To: <20200221133902.21622-1-eugen.hristev@microchip.com>
References: <20200221133902.21622-1-eugen.hristev@microchip.com>
Message-ID: <20200223215806.5a5a8d81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Fri, 21 Feb 2020 15:39:02 +0200
Eugen Hristev <eugen.hristev@microchip.com> wrote:

> Bump to latest git version.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

I think it's OK to bump to this version, the tarball is indeed very old
and no longer available for the current location used by Buildroot.

> -FSWEBCAM_VERSION = 20140113
> -FSWEBCAM_SOURCE = fswebcam-$(FSWEBCAM_VERSION).tar.xz
> -FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
> +FSWEBCAM_VERSION = 9a995d6a5369ddd158e352766e015dae20982318
> +FSWEBCAM_SITE = https://github.com/fsphil/fswebcam.git
> +FSWEBCAM_SITE_METHOD = git

Could you instead use the "github" macro available in Buildroot? This
way, we download a tarball from Github, which is much more efficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
