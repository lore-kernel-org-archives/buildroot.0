From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Fri,  8 Apr 2016 10:58:49 +0200
Subject: [Buildroot] [PATCH 1/1] xorriso: Unify help description
Message-ID: <1460105929-10723-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 package/xorriso/Config.in | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
index 2ac2d83..f9bb10a 100644
--- a/package/xorriso/Config.in
+++ b/package/xorriso/Config.in
@@ -5,18 +5,17 @@ config BR2_PACKAGE_XORRISO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
-	  xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
+	  xorriso copies file objects from POSIX compliant
+	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
+	  and allows session-wise manipulation of such filesystems.
+	  It can load the management information of existing ISO
+	  images and it writes the session results to optical media
+	  or to filesystem objects.
 
-	  libburnia is a project for reading, mastering and writing
-	  optical discs. Currently it is comprised of libraries named
-	  libisofs, libburn, libisoburn, a cdrecord emulator named
-	  cdrskin, and an integrated multi-session tool named xorriso.
-	  The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
-	  It is base of the GNU xorriso package and is actively
-	  maintained.
+	  Vice versa xorriso is able to copy file objects out of ISO
+	  9660 filesystems.
 
-	  http://libburnia-project.org/
-	  http://www.gnu.org/software/xorriso
+	  https://www.gnu.org/software/xorriso
 
 comment "xorriso needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.1.4
