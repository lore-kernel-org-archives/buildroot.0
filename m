From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:48:58 +0200
Subject: [Buildroot] [PATCH] autofs: bump to version 5.1.3
In-Reply-To: <df4b1565a74bc077220f13c0487cdcfed539465a.1496944022.git.baruch@tkos.co.il>
References: <df4b1565a74bc077220f13c0487cdcfed539465a.1496944022.git.baruch@tkos.co.il>
Message-ID: <20170608214858.2f862249@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Jun 2017 20:47:02 +0300, Baruch Siach wrote:
> Drop upstream patches.
> 
> Cc: Jonathan Ben Avraham <yba@tkos.co.il>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...fs-build-check-for-clock_gettime-in-librt.patch | 62 ----------------------
>  ...dd-cache-variable-for-Linux-proc-filesyst.patch | 47 ----------------
>  package/autofs/autofs.hash                         |  2 +-
>  package/autofs/autofs.mk                           |  5 +-
>  4 files changed, 2 insertions(+), 114 deletions(-)
>  delete mode 100644 package/autofs/0002-autofs-build-check-for-clock_gettime-in-librt.patch
>  delete mode 100644 package/autofs/0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
