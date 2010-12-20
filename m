From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Dec 2010 11:17:05 +0100
Subject: [Buildroot] [git commit master 1/1] qt: svg and multimedia modules
	depends on gui module as well
Message-ID: <20101220101735.166D28C9F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=11ab05f53a16f635a27139b33170a9dadba9f3c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ddee2cc..faebfa0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -310,6 +310,7 @@ config BR2_PACKAGE_QT_XMLPATTERNS
 
 config BR2_PACKAGE_QT_MULTIMEDIA
 	bool "Multimedia Module"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Build QtMultimedia module.
 
@@ -322,6 +323,7 @@ config BR2_PACKAGE_QT_AUDIO_BACKEND
 
 config BR2_PACKAGE_QT_SVG
 	bool "SVG Module"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Build the SVG module.
 	  If unsure, say n
-- 
1.7.2.2
