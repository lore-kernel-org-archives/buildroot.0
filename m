From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:55:50 +0100
Subject: [Buildroot] [git commit branch/next] package/kf5: drop
 QT5_VERSION_LATEST logic
Message-ID: <20200227224530.9DADD7FE80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41425ef67aabe5d54ac5a5501bf7fefac8f170e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that the version selection has been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kf5/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index aecbb932f5..030759f376 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -1,7 +1,6 @@
 menuconfig BR2_PACKAGE_KF5
 	bool "KF5"
 	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	help
 	  This option enables the KF5 KDE Frameworks. Sub-options
 	  allow to select which modules should be built.
