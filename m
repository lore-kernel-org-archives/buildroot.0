From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 12:39:57 +0200
Subject: [Buildroot] [git commit] qt5imageformats: needs gui support in
	qt5base
Message-ID: <20130511104052.5BF9C9A090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88587d5b146cc644d8ef7135142dd6e107290ac0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8843619e91958766c66c0955f363bbfc733b31e6/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5imageformats/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
index d37e08f..f976caf 100644
--- a/package/qt5/qt5imageformats/Config.in
+++ b/package/qt5/qt5imageformats/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5IMAGEFORMATS
 	bool "qt5imageformats"
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
