From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 15:47:09 +0200
Subject: [Buildroot] [git commit] Fix qt samples dependency on QtGUI
Message-ID: <20120419194555.11EDB96B1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a33f6dfd50227d2224b987ba99eae57c6c92fc2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 1ce6348..88855d2 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_QT_DEBUG
 
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install demos and examples (with code)"
+	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
 
