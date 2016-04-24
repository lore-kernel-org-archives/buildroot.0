From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:23:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to
 16.1-Jarvis
In-Reply-To: <1461500584-9143-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461500584-9143-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424172335.176d36dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 14:23:04 +0200, Bernd Kuhls wrote:
> Removed patch 0005, applied upstream, and renumbered the remaining
> patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...artly-backport-of-PR-9231-to-fix-segfault.patch | 200 ---------------------
>  ...xturePacker-fix-compilation-with-gcc-4.6.patch} |   0
>  .../{0007-ffmpeg30.patch => 0006-ffmpeg30.patch}   |   0
>  package/kodi/kodi.hash                             |   2 +-
>  package/kodi/kodi.mk                               |   2 +-
>  5 files changed, 2 insertions(+), 202 deletions(-)
>  delete mode 100644 package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch
>  rename package/kodi/{0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch => 0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch} (100%)
>  rename package/kodi/{0007-ffmpeg30.patch => 0006-ffmpeg30.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
