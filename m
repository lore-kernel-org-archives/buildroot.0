From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 20:14:36 +0200
Subject: [Buildroot] [git commit] qt download site update
Message-ID: <20181020181302.169A87F9D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e6cd5c2d622eb1d092c1639b129a24e79c84367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download link was broken, former qt versions are stored into a
distinct location.

Signed-off-by: Francois Gerin <francois.gerin@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 921ff13d29..23cb94c11f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -7,7 +7,7 @@
 QT_VERSION_MAJOR = 4.8
 QT_VERSION = $(QT_VERSION_MAJOR).7
 QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
+QT_SITE = http://download.qt.io/archive/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
