From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 10:43:14 +0200
Subject: [Buildroot] [PATCH] package/swupdate: Backport fixes
In-Reply-To: <20200716082042.9335-1-offougajoris@gmail.com>
References: <20200716082042.9335-1-offougajoris@gmail.com>
Message-ID: <20200716104314.18375240@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

On Thu, 16 Jul 2020 10:20:41 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> Applied same commit [1] of  meta-swupdate for fixes:
> 
> [2] Shellscript stops before completing
> [3] diskpart: force kernel to reread partition table
> 
> [1]: https://github.com/sbabic/meta-swupdate/commit/3fccf23e2816b176075588309e3e4702a318dfc7
> [2]: https://github.com/sbabic/swupdate/commit/1078af97a5ac5c3091c8e601b836cd69a7aab7fc
> [3]: https://github.com/sbabic/swupdate/commit/e3a6b120ff88f6dc34570002de97754b607966ec
> 
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>

Thanks. However, we do require Buildroot contributors to sign-off on
the patches they integrate from other sources into Buildroot, so you
should add your Signed-off-by below the ones that are already present
in each patch.

See https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
