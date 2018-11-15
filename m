From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 11:37:01 +0100
Subject: [Buildroot] [PATCH] uclibc: Get rid of stale
 UCLIBC_INSTALL_LDSO_SYMLINKS
In-Reply-To: <20181114163029.33006-1-abrodkin@synopsys.com>
References: <20181114163029.33006-1-abrodkin@synopsys.com>
Message-ID: <20181115113701.016d5f9e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 19:30:29 +0300, Alexey Brodkin wrote:
> UCLIBC_INSTALL_LDSO_SYMLINKS is not defined anywhere to nuke it.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Indeed, it was removed as part of commit
d1e19882be8676e6a7f451517d786703c6ccd6cb ("uclibc: symlinks are now
automatically created by uClibc-ng makefile")

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
