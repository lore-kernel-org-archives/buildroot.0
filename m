From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:24:18 +0100
Subject: [Buildroot] [git commit] package/tovid: Fix typo
Message-ID: <20151129132450.0638B8073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0807e5dce99e54e6a990766240fc993be586c31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tovid/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 79eaec4..093bfdf 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on !nios2 # ffmpeg
+	depends on !BR2_nios2 # ffmpeg
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
