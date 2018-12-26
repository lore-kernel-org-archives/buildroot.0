From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:41:30 +0100
Subject: [Buildroot] [PATCH 1/1] mender: Bump version to 1.7.0
In-Reply-To: <20181223013500.9487-1-aduskett@gmail.com>
References: <20181223013500.9487-1-aduskett@gmail.com>
Message-ID: <20181226224130.00e06839@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Dec 2018 20:35:00 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
> - Remove upstreamed patch.
> - Update license files sha256sum's due to year changes.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  .../0001-FIX-Enabling-compiling-ppc64le.patch | 37 -------------------
>  package/mender/mender.hash                    |  8 ++--
>  package/mender/mender.mk                      |  2 +-
>  3 files changed, 5 insertions(+), 42 deletions(-)
>  delete mode 100644 package/mender/0001-FIX-Enabling-compiling-ppc64le.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
