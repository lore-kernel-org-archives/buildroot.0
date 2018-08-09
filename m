From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 22:16:02 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: bump to v2018.05.0 and
 add hashes
In-Reply-To: <20180806192536.11559-1-m.niestroj@grinn-global.com>
References: <20180806192536.11559-1-m.niestroj@grinn-global.com>
Message-ID: <20180809221602.0c8c89f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Aug 2018 21:25:36 +0200, Marcin Niestroj wrote:
> Also drop mainlined patches.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  ...-common-Rename-strlcpy-to-DT_strlcpy.patch | 58 -------------------
>  ...02-common-Include-sys-types.h-header.patch | 38 ------------
>  package/dt-utils/dt-utils.hash                |  3 +
>  package/dt-utils/dt-utils.mk                  |  2 +-
>  4 files changed, 4 insertions(+), 97 deletions(-)
>  delete mode 100644 package/dt-utils/0001-common-Rename-strlcpy-to-DT_strlcpy.patch
>  delete mode 100644 package/dt-utils/0002-common-Include-sys-types.h-header.patch
>  create mode 100644 package/dt-utils/dt-utils.hash

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
