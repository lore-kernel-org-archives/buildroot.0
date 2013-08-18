From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 19:49:43 +0200
Subject: [Buildroot] [git commit] qt5: change upstream URL
Message-ID: <20130818175020.C54629B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ed05f0ff666f5be9b485ccc91b29825326fcd37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt5 upstream URL has changed, which leads to build failures in the
autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index c96cdf5..9e71c83 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION = 5.0.2
-QT5_SITE = http://releases.qt-project.org/qt5/$(QT5_VERSION)/submodules/
+QT5_SITE = http://download.qt-project.org/archive/qt/5.0/$(QT5_VERSION)/submodules/
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
