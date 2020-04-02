From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 Apr 2020 18:51:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump to version 1.4.0
Message-ID: <20200402165157.46179-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.hash | 4 ++--
 package/libunwind/libunwind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index c8d44b44ac..e3709b1b1a 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8  libunwind-1.3.1.tar.gz
+sha256  df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435  libunwind-1.4.0.tar.gz
 
 # Hash for license file
-sha256 6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
+sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 26deaa5f00..a5bcec6be6 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.3.1
+LIBUNWIND_VERSION = 1.4.0
 LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
-- 
2.25.1
