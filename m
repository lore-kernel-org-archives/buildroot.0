From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:50:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/opencv: bump version to 2.4.13.2
In-Reply-To: <20170419101142.13051-1-bernd.kuhls@t-online.de>
References: <20170419101142.13051-1-bernd.kuhls@t-online.de>
Message-ID: <20170502225053.5fcd1a05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 12:11:41 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://github.com/opencv/opencv/commit/c7045184ce220a04796d8e9072ac42d2d362dc71
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...xt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} |  0
>  ...ypes_c.h-Fix-compiling-VFP-assembler-code.patch | 37 ----------------------
>  package/opencv/opencv.hash                         |  2 +-
>  package/opencv/opencv.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 39 deletions(-)
>  rename package/opencv/{0004-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch => 0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} (100%)
>  delete mode 100644 package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
