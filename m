From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:01:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: drop second patch
In-Reply-To: <20191002164700.26771-1-fontaine.fabrice@gmail.com>
References: <20191002164700.26771-1-fontaine.fabrice@gmail.com>
Message-ID: <20191002210104.21757a2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 18:47:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Second patch is not needed anymore as the only, optional, dependency of
> libusb is udev which can't be built statically
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...check-for-g-when-FTDIPP-is-disabled.patch} |  0
>  .../0002-cmake-fix-FindUSB1.cmake.patch       | 34 -------------------
>  ...-swig.patch => 0003-cmake-find-swig.patch} |  0
>  3 files changed, 34 deletions(-)
>  rename package/libftdi1/{0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch => 0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch} (100%)
>  delete mode 100644 package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
>  rename package/libftdi1/{0004-cmake-find-swig.patch => 0003-cmake-find-swig.patch} (100%)

Applied to master, thanks. I'm curious, how did you notice that this
patch was no longer needed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
