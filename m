From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 16:45:25 +0200
Subject: [Buildroot] [git commit] lsof: bump to version 4.89
Message-ID: <20151002144615.CA1A081DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36a686c4a49a3e6051836b6d2eb36bae8c2fa47c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch the homepage to a non-ftp site.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/Config.in |    2 +-
 package/lsof/lsof.hash |    2 +-
 package/lsof/lsof.mk   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 820cbf7..7b7e47d 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LSOF
 	  The lsof tool lists information about files opened by
 	  processes.
 
-	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+	  http://people.freebsd.org/~abe/
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index d1e289a..4a1249f 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fe6f9b0e26b779ccd0ea5a0b6327c2b5c38d207a6db16f61ac01bd6c44e5c99b	lsof_4.88.tar.bz2
+sha256	81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718	lsof_4.89.tar.bz2
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f9b7661..312d834 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.88
+LSOF_VERSION = 4.89
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 # Use http mirror since master ftp site access is very draconian
 LSOF_SITE = http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof
