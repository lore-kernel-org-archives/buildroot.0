From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 14:13:00 +0200
Subject: [Buildroot] [git commit] qt5webkit: needs gui support in qt
Message-ID: <20130828121316.87B129A69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca47afb41e44df6f4d3526d839ffae50aadec5d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/439ce2c3c33a92966808071d4fc7231d50453c79/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5webkit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 319d84a..48b5125 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
