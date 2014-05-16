From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 22:00:37 +0200
Subject: [Buildroot] [git commit] qt5quick1: add missing dependency on
	network module
Message-ID: <20140516200145.9E84B9CC27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d9f09a10813fe4ce2f7ed929873edb3f536a77d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quick1/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 59b6c34..32656be 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
