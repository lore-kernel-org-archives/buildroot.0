From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:47:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] fs/common.mk: do not store original
 names and timestamps when creating GZIP rootfs
In-Reply-To: <20190716174214.11914-1-itsatharva@gmail.com>
References: <20190716174214.11914-1-itsatharva@gmail.com>
Message-ID: <20190717084715.5614d171@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Tue, 16 Jul 2019 23:12:13 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> We don't use the GZIP environment variable to store GZIP options
> anymore. So explicitly add -n argument to the GZIP call to ensure
> reproducibility.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - Reversed order of patches
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks! I had to reword a little bit the commit log of
PATCH 1/2, because the wording was no longer really appropriate after
you swapped the order of the two patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
