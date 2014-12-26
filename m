From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:16:35 +0100
Subject: [Buildroot] [git commit] qt5: remove hash file of the non-existing
	package
Message-ID: <20141226141640.93A9B80126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67d75687c8e440fcf89655ad46d4488705b5fd45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added accidentally in 1e93aa4b9973c24cb16446b2373c222d512eb2e5.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5location/qt5location.hash |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
deleted file mode 100644
index 9aad1a9..0000000
--- a/package/qt5/qt5location/qt5location.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtbase-opensource-src-5.3.2.tar.xz.mirrorlist
-sha256 9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8 qtbase-opensource-src-5.3.2.tar.xz
-sha1   faf4f33aa7e8dabcdcdf5f10824263beebbccd96                         qtbase-opensource-src-5.3.2.tar.xz
-md5    563e2b10274171f1184b3fd7260b4991                                 qtbase-opensource-src-5.3.2.tar.xz
