From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:54:04 +0100
Subject: [Buildroot] [PATCH] package/gcc/7.4.0: remove upstream patch
In-Reply-To: <20181209135054.6304-1-romain.naour@gmail.com>
References: <20181209135054.6304-1-romain.naour@gmail.com>
Message-ID: <20181209165404.7bd053fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 14:50:54 +0100, Romain Naour wrote:
> 0001-m68k-coldfire-pr68467.patch is already upstream and backported to
> gcc 7.4.0 [1].
> 
> [1] https://github.com/gcc-mirror/gcc/commit/2d1d94491cc66e240f9ca2845ec64e8ffe851c74
> 
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/131924271
> https://gitlab.com/ymorin/buildroot/-/jobs/131924272
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch | 48 ----------------------
>  1 file changed, 48 deletions(-)
>  delete mode 100644 package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
