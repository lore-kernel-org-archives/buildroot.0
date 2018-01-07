From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:36:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump version to 7.6.2
In-Reply-To: <20180107190831.4890-1-bernd.kuhls@t-online.de>
References: <20180107190831.4890-1-bernd.kuhls@t-online.de>
Message-ID: <20180107213627.24e5ab6b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 20:08:31 +0100, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0002-Fix-uClibc-build.patch
> https://github.com/ivmai/bdwgc/commit/047230b71d421407ad2c8641ee4a87a1bd89145b
> 
> 0003-configure-match-uclinux-pattern.patch
> https://github.com/ivmai/bdwgc/commit/a628c90bdbf397465ac2ab2b11f14eb2e853651c
> 
> Renumbered remaining patches, added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...tv-is-unknown-error-in-brief_async_signa.patch} |  0
>  package/bdwgc/0002-Fix-uClibc-build.patch          | 42 ----------------------
>  .../0003-configure-match-uclinux-pattern.patch     | 27 --------------
>  package/bdwgc/bdwgc.hash                           |  3 +-
>  package/bdwgc/bdwgc.mk                             |  2 +-
>  5 files changed, 3 insertions(+), 71 deletions(-)
>  rename package/bdwgc/{0003-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch => 0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch} (100%)
>  delete mode 100644 package/bdwgc/0002-Fix-uClibc-build.patch
>  delete mode 100644 package/bdwgc/0003-configure-match-uclinux-pattern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
