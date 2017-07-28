From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 01:13:01 +0200
Subject: [Buildroot] [git commit] qt-webkit-kiosk: put Config.in dependency
	comments in our typical format
Message-ID: <20170728230930.D91C2821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea11de78a47e53d62cc036daec7788eb6f839a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forgotten to push in the previous commit

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt-webkit-kiosk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index c613a8e..71b4f83 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu/qt5webkit
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu/qt5webkit
-	depends on !BR2_BINFMT_FLAT # icu/qt5webkit
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5webkit -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
+	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
