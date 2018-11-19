From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:38:42 +0100
Subject: [Buildroot] [PATCH v2] boot/syslinux: Fix build with glibc 2.28+
In-Reply-To: <20181114205433.3233-1-alexander.sverdlin@gmail.com>
References: <20181114205433.3233-1-alexander.sverdlin@gmail.com>
Message-ID: <20181119223842.2afd705b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 21:54:33 +0100, Alexander Sverdlin wrote:
> When building with glibc 2.28+, the "major", "minor" and "makedev"
> functions are defined in "sys/sysmacros.h". The patch
> "extlinux: pull in sys/sysmacros.h for major/minor/makedev",
> applied to Syslinux during 2016Apr, should help. Please note that not
> only Syslinux is affected by this change in glibc.
> 
> Link: https://www.syslinux.org/wiki/index.php?title=Building
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
