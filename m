From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:05 +0100
Subject: [Buildroot] [PATCH v2 34/37] package/kf5: drop QT5_VERSION_LATEST
 logic
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-34-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.20.1
