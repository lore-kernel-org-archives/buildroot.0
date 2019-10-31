From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 11:24:46 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/file: bump
 version to 5.37
Message-ID: <20191031101823.270E48E1B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df67c095670e90a7ef3e919f8e96fca68a1cbb68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Changelog: https://github.com/file/file/blob/master/ChangeLog
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e0b08703046ecd2e3eb71beb867ab87d23e6c789)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.hash | 4 ++--
 package/file/file.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 7948e856ee..241820d0fb 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.36.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.37.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256 fb608290c0fd2405a8f63e5717abf6d03e22e183fb21884413d1edd918184379  file-5.36.tar.gz
+sha256 e9c13967f7dd339a3c241b7710ba093560b9a33013491318e88e6b8b57bae07f  file-5.37.tar.gz
 sha256 0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256 4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
 sha256 7ac061e1a1c840c4dfa0573aec6f3497676c9295b5ec4190d3576646eb1646bf  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index 1a835015a7..a13acbc47c 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.36
+FILE_VERSION = 5.37
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
