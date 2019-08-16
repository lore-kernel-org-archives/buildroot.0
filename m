From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 16 Aug 2019 13:16:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: Security bump to version
 0.27.9
Message-ID: <20190816111642.21783-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
This one is for the master branch.

0.27.9 is a backport of the security patch to the 0.27 series.
Another patch bumping libgit2 to 0.28.3 will be queued for next.

---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 54e309172a..2d06c26d2d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-0.27.8.tar.gz
+sha256	adf17310b590e6e7618f070c742b5ee028aeeed2c60099bc4190c386b5060de1  libgit2-0.27.9.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b8880fea81..25a93d72f3 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 0.27.8
+LIBGIT2_VERSION = 0.27.9
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.23.0.rc1
