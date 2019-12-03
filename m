From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:54:56 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/kf5: add an
 upstream URL to Config.in
Message-ID: <20191203134706.1EABF846DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83e3b971dfce032be1f58a62229a18721c27247c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3da11f9d4ae8001d30775054e5fc34d619dfa97a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
