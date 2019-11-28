From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 10:48:20 +0000
Subject: [Buildroot] [PATCH 1/1] package/kf5: add an upstream URL to
 Config.in
Message-ID: <20191128104820.14735-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/kf5/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 2e50bce49e..aecbb932f5 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -6,6 +6,8 @@ menuconfig BR2_PACKAGE_KF5
 	  This option enables the KF5 KDE Frameworks. Sub-options
 	  allow to select which modules should be built.
 
+	  https://techbase.kde.org/KDE_Frameworks
+
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
 source "package/kf5/kf5-kcoreaddons/Config.in"
-- 
2.20.1
