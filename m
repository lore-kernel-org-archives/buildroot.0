From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:49:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/transmission: bump version to
 2.9.4
In-Reply-To: <20180502060540.11628-1-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
Message-ID: <20180520154901.26887f95@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 08:05:37 +0200, Bernd Kuhls wrote:
> Removed patch 0003, a different fix was committed upstream:
> https://github.com/transmission/transmission/commit/b21a6140e963491f146293c9b0a2863a9ae99ad3
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...tp-include.patch => 0003-fix-utp-include.patch} |  0
>  package/transmission/0003-miniupnpc-cross.patch    | 31 ----------------------
>  ...nce-1.0.18-has-sys-quota.h-synced-with-G.patch} |  0
>  ...0006-libsystemd.patch => 0005-libsystemd.patch} |  0
>  package/transmission/transmission.hash             |  2 +-
>  package/transmission/transmission.mk               |  2 +-
>  6 files changed, 2 insertions(+), 33 deletions(-)
>  rename package/transmission/{0004-fix-utp-include.patch => 0003-fix-utp-include.patch} (100%)
>  delete mode 100644 package/transmission/0003-miniupnpc-cross.patch
>  rename package/transmission/{0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch => 0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch} (100%)
>  rename package/transmission/{0006-libsystemd.patch => 0005-libsystemd.patch} (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
