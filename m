From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:08 +0100
Subject: [Buildroot] [PATCH v2 37/37] package/qt5: drop QT5_VERSION_LATEST
 symbol
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-37-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all the references to this symbol are gone, remove the blind
symbol.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
New in v2

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
-- 
2.20.1
