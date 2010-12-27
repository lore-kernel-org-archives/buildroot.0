From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Dec 2010 00:07:53 +0100
Subject: [Buildroot] [git commit master 1/1] qt: dbus module needs gui
	support as well
Message-ID: <20101227230818.C161E8EB87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bff52482023a055aab28602ac630d229303c9013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index faebfa0..e5fe325 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -284,7 +284,6 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	help
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
-endif
 
 comment "Qt DBbus module not available (need dbus)"
 	depends on !BR2_PACKAGE_DBUS
@@ -294,6 +293,7 @@ config BR2_PACKAGE_QT_DBUS
 	depends on BR2_PACKAGE_DBUS
 	help
 	  Build the Qt DBus module.
+endif
 
 config BR2_PACKAGE_QT_XML
 	bool "XML Module"
-- 
1.7.2.2
