From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:05:13 +0100
Subject: [Buildroot] [PATCH] keyutils: bump to version 1.6
In-Reply-To: <6e85f490000f44ac712e4e9065abd38641b7ffd2.1543838854.git.baruch@tkos.co.il>
References: <6e85f490000f44ac712e4e9065abd38641b7ffd2.1543838854.git.baruch@tkos.co.il>
Message-ID: <20181206220513.787675ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 14:07:34 +0200, Baruch Siach wrote:
> Refresh patch 0001.
> 
> Drop patch 0003; no longer needed after upstream headers rearrange.
> 
> Add license hash.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/keyutils/0001-fix-install-rule.patch  | 10 +++---
>  .../0003-Add-missing-limits.h-include.patch   | 32 -------------------
>  package/keyutils/keyutils.hash                |  4 ++-
>  package/keyutils/keyutils.mk                  |  2 +-
>  4 files changed, 10 insertions(+), 38 deletions(-)
>  delete mode 100644 package/keyutils/0003-Add-missing-limits.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
