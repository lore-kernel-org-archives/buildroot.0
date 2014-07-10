From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 17:00:21 +0200
Subject: [Buildroot] [git commit] qt5base: fix typo
Message-ID: <20140710150058.2D4599C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a00418e117ce712857358522c6c506e78e85ccb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 70ddcd3..24e5902 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -126,7 +126,7 @@ config BR2_PACKAGE_QT5BASE_DIRECTFB
 config BR2_PACKAGE_QT5BASE_XCB
 	bool "X.org XCB support"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBX11
+	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
