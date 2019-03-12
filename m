From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:37:58 +0100
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 4.20.0
In-Reply-To: <5ae4f299bdd123734b834aa0da5f4baf4286e93e.1552406122.git.baruch@tkos.co.il>
References: <5ae4f299bdd123734b834aa0da5f4baf4286e93e.1552406122.git.baruch@tkos.co.il>
Message-ID: <20190312213758.52fe38f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 17:55:22 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop upstream patch. Renumber the remaining patch.
> 
> Add upstream patch fixing build with musl libc.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ss-fix-compilation-under-glibc-2.18.patch} |  0
>  ...rovide-fallback-CLOCK_TAI-definition.patch | 32 -------------------
>  ...02-f_flower-fix-build-with-musl-libc.patch | 31 ++++++++++++++++++
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  |  2 +-
>  5 files changed, 33 insertions(+), 34 deletions(-)
>  rename package/iproute2/{0002-ss-fix-compilation-under-glibc-2.18.patch => 0001-ss-fix-compilation-under-glibc-2.18.patch} (100%)
>  delete mode 100644 package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch
>  create mode 100644 package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
