From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:35:15 +0200
Subject: [Buildroot] [for-next] package/powertop: bump to version 2.9
In-Reply-To: <20170511212217.7952-1-romain.naour@gmail.com>
References: <20170511212217.7952-1-romain.naour@gmail.com>
Message-ID: <20170511233515.7db7b2d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 23:22:17 +0200, Romain Naour wrote:
> Remove upstream patch, so we don't need to autoreconf
> Rename patch 0002 -> 0001
> Add POWERTOP_SOURCE to adjust to the new archive naming.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-autotune-fix-use-after-close.patch        | 15 ----------
>  ...001-dont-force-stack-smashing-protection.patch} |  0
>  .../0003-add-missing-sys-time.h-header.patch       | 35 ----------------------
>  .../powertop/0004-add-missing-stdio.h-header.patch | 35 ----------------------
>  package/powertop/powertop.hash                     |  2 +-
>  package/powertop/powertop.mk                       |  6 ++--
>  6 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 package/powertop/0001-autotune-fix-use-after-close.patch
>  rename package/powertop/{0002-dont-force-stack-smashing-protection.patch => 0001-dont-force-stack-smashing-protection.patch} (100%)
>  delete mode 100644 package/powertop/0003-add-missing-sys-time.h-header.patch
>  delete mode 100644 package/powertop/0004-add-missing-stdio.h-header.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
