From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 26 Dec 2014 14:06:41 +0200
Subject: [Buildroot] [PATCH 2/4] qt5: remove hash file of the non-existing
	package
In-Reply-To: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
References: <1419595603-15591-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1419595603-15591-2-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added accidentally in 1e93aa4b9973c24cb16446b2373c222d512eb2e5.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5location/qt5location.hash | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 package/qt5/qt5location/qt5location.hash

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
-- 
1.9.1
