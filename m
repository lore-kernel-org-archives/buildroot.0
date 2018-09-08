From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:47:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vlc: bump version to 3.0.4
In-Reply-To: <20180906201841.17047-1-bernd.kuhls@t-online.de>
References: <20180906201841.17047-1-bernd.kuhls@t-online.de>
Message-ID: <20180908154703.2ad4ca89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 22:18:41 +0200, Bernd Kuhls wrote:
> Removed patch 0004, applied upstream.
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...e-name-of-the-vorbis-and-ogg-librar.patch} |  0
>  .../0004-qt-fix-build-against-Qt-5.11.patch   | 33 -------------------
>  ...-using-uClibc-by-adding-sys-types.h.patch} |  0
>  ...on-t-assume-strerror_l-is-available.patch} |  0
>  ...ent-run-time-fallback-to-real-time-.patch} |  0
>  ...build-support-and-fix-10bit-support.patch} |  0
>  ...ch => 0009-Add-support-for-freerdp2.patch} |  0
>  ...-use-AC_PATH_PROG-to-check-for-wayl.patch} |  0
>  package/vlc/vlc.hash                          | 12 +++----
>  package/vlc/vlc.mk                            |  2 +-
>  10 files changed, 7 insertions(+), 40 deletions(-)
>  rename package/vlc/{0005-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch => 0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch} (100%)
>  delete mode 100644 package/vlc/0004-qt-fix-build-against-Qt-5.11.patch
>  rename package/vlc/{0006-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch => 0005-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch} (100%)
>  rename package/vlc/{0007-Don-t-assume-strerror_l-is-available.patch => 0006-Don-t-assume-strerror_l-is-available.patch} (100%)
>  rename package/vlc/{0008-posix-remove-ancient-run-time-fallback-to-real-time-.patch => 0007-posix-remove-ancient-run-time-fallback-to-real-time-.patch} (100%)
>  rename package/vlc/{0009-x264-drop-148-build-support-and-fix-10bit-support.patch => 0008-x264-drop-148-build-support-and-fix-10bit-support.patch} (100%)
>  rename package/vlc/{0010-Add-support-for-freerdp2.patch => 0009-Add-support-for-freerdp2.patch} (100%)
>  rename package/vlc/{0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch => 0010-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
