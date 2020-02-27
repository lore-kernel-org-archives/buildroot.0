From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:56:04 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5: drop
 QT5_VERSION_LATEST symbol
Message-ID: <20200227224530.B5C808E823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=993ddd2765024b1213cbd55e6ca4912419b40118
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that all the references to this symbol are gone, remove the blind
symbol.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 7051bf517a..4bbc688249 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -37,10 +37,6 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 
-config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool
-	default y
-
 source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
