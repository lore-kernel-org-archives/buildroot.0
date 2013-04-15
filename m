From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:47:04 +0200
Subject: [Buildroot] [git commit] qt5: bump to 5.0.2
Message-ID: <20130415215907.645E99B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6b2bac22524e2b3b063660850b34de5c3e9edc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new version of Qt5 has been released, 5.0.2, so let's use it, see
http://blog.qt.digia.com/blog/2013/04/10/qt-5-0-2-released/: "Qt 5.0.2
brings over 600 improvements compared to Qt 5.0.1, most of these in
order to address the issues Qt users have noted when bringing their
applications to Qt 5.".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index c6bbbe0..c96cdf5 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
-QT5_VERSION = 5.0.1
-QT5_SITE = http://releases.qt-project.org/qt5/$(QT5_VERSION)/submodules_tar/
+QT5_VERSION = 5.0.2
+QT5_SITE = http://releases.qt-project.org/qt5/$(QT5_VERSION)/submodules/
 include package/qt5/*/*.mk
 
 define QT5_LA_PRL_FILES_FIXUP
