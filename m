From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:37:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/f2fs-tools: add host package
In-Reply-To: <20181026200016.30856-2-grzegorz@blach.pl>
References: <20181026200016.30856-1-grzegorz@blach.pl>
 <20181026200016.30856-2-grzegorz@blach.pl>
Message-ID: <20181103153733.0ada615d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Oct 2018 22:00:15 +0200, Grzegorz Blach wrote:
> This package is useful to create f2fs filesystem during build process.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Thanks, I have applied, after adding --without-selinux --without-blkid
to HOST_F2FS_TOOLS_CONF_OPTS. --without-blkid was suggested by Yann.
However, contrary to Yann, I don't think we should unconditionally
enable SELinux support, so I've added a --without-selinux.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
