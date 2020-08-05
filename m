From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:08:41 +0200
Subject: [Buildroot] [git commit] package/valgrind: bump version to 3.16.1
Message-ID: <20200805210305.2A26082878@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b9ffa6fa979ff72e69dcd917843099d264420c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* 3.16.1 fixes two critical bugs discovered after 3.16.0 was frozen.
  for details see [1].
* changed SITE from ftp to https.

[1] https://www.valgrind.org/docs/manual/dist.news.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 942b4a8caf..2b24ac44b6 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,5 +1,5 @@
-# From http://valgrind.org/downloads/current.html
-md5  495b30af5e5ed62ebb9bb777ee19b27f  valgrind-3.16.0.tar.bz2
+# From https://valgrind.org/downloads/current.html
+md5  d1b153f1ab17cf1f311705e7a83ef589  valgrind-3.16.1.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 035d7b23e9..7fd3278614 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.16.0
-VALGRIND_SITE = ftp://sourceware.org/pub/valgrind
+VALGRIND_VERSION = 3.16.1
+VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
