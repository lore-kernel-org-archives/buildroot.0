From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:36:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/leptonica: bump version to
 1.74.4
In-Reply-To: <20170725202333.14537-1-bernd.kuhls@t-online.de>
References: <20170725202333.14537-1-bernd.kuhls@t-online.de>
Message-ID: <20170725223635.08437da8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 22:23:33 +0200, Bernd Kuhls wrote:
> Removed patch 0001, not needed anymore after
> https://github.com/DanBloomberg/leptonica/commit/4476d162cc191a0fefb2ce434153e12bbf188664
> fixes the problem in a similar way.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch | 42 ----------------------
>  package/leptonica/leptonica.hash                   |  2 +-
>  package/leptonica/leptonica.mk                     |  7 +---
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/leptonica/0001-configure.ac-Use-PKG_CHECK_MODULES-to-check-libtiff.patch

Applied to master, thanks.

Are you doing runtime testing for all of those packages ?

We already have > 180 patches waiting in patchwork. What we really need
is people reviewing patches, much more than tons of version bumps.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
