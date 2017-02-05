From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 15:52:49 +0100
Subject: [Buildroot] [PATCH] libamcodec: bump version to
 296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca
In-Reply-To: <20170203121117.16653-1-daggs@gmx.com>
References: <20170203121117.16653-1-daggs@gmx.com>
Message-ID: <20170205155249.47b4036d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Feb 2017 14:11:17 +0200, Dagg Stompler wrote:
>  - remove 0001-Include-stdint.h-where-needed.patch as it was merged into
>    the tree.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  .../0001-Include-stdint.h-where-needed.patch       | 47 ----------------------
>  package/libamcodec/libamcodec.hash                 |  2 +-
>  package/libamcodec/libamcodec.mk                   |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/libamcodec/0001-Include-stdint.h-where-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
