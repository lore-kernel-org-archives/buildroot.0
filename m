From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:11:02 +0100
Subject: [Buildroot] [git commit] package/sysdig: reorder selects
 alphabetically
Message-ID: <20191222220252.C46138DAE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b6df53d53e2322c41856c46d7cc4f28880c95cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysdig/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 672c44d211..c37d8d05cc 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -7,15 +7,15 @@ config BR2_PACKAGE_SYSDIG
 	depends on !BR2_STATIC_LIBS # luajit, elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_JQ
-	select BR2_PACKAGE_LIBB64
-	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux
