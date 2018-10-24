From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:28:22 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] qt download site update
Message-ID: <20181024122639.B582388957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73ea45a608f560d261da66b6e9ab9cba7add3e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The download link was broken, former qt versions are stored into a
distinct location.

Signed-off-by: Francois Gerin <francois.gerin@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e6cd5c2d622eb1d092c1639b129a24e79c84367)
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
 
