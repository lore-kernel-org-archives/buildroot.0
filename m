From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:57:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: bump version to 2.4.13.3
In-Reply-To: <20170916133334.24964-1-bernd.kuhls@t-online.de>
References: <20170916133334.24964-1-bernd.kuhls@t-online.de>
Message-ID: <20170917185704.14a507c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Sep 2017 15:33:34 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0002-avoid-sysctl_h.patch
> https://github.com/opencv/opencv/commit/61936eb1a43e732e4bc1c75b63e6cab85c6f9e94
> 
> 0004-fix-static-linking.patch
> https://github.com/opencv/opencv/commit/70489b1e2232ead1701519e35d151670b74c3f70
> 
> In-source-builds are not allowed anymore:
> https://github.com/opencv/opencv/commit/777a0080cbdb98761853519b3f45136727a855c2
> 
> Re-numbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...xt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} |  0
>  package/opencv/0002-avoid-sysctl_h.patch           | 61 ----------------------
>  package/opencv/0004-fix-static-linking.patch       | 45 ----------------
>  package/opencv/opencv.hash                         |  2 +-
>  package/opencv/opencv.mk                           |  3 +-
>  5 files changed, 3 insertions(+), 108 deletions(-)
>  rename package/opencv/{0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch => 0002-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} (100%)
>  delete mode 100644 package/opencv/0002-avoid-sysctl_h.patch
>  delete mode 100644 package/opencv/0004-fix-static-linking.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
