From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 12:30:27 +0200
Subject: [Buildroot] [git commit] libfreefare: new repository
Message-ID: <20131025103122.AA3C59BB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4f839248d2d57406db85803ab041d03cbaaffda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also adjust upstream URL]
Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreefare/Config.in      |    2 +-
 package/libfreefare/libfreefare.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index bc11b8b..2bb0c93 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBFREEFARE
 	help
 	  Library for high level manipulation of MIFARE cards.
 
-	  http://code.google.com/p/nfc-tools/wiki/libfreefare
+	  http://nfc-tools.org/index.php?title=Libfreefare
 
 comment "libfreefare needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 859b5e3..8dcd6b8 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFREEFARE_VERSION = 0.3.4
-LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
+LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
 $(eval $(autotools-package))
