From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 17:03:02 +0200
Subject: [Buildroot] [PATCH 1/1] libpfm4: bump to version 4.9.0
Message-ID: <20180520150302.4205-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpfm4/libpfm4.hash | 7 ++++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index 8bebc493fd..20671fb6e0 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,5 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  2ed06d6e746f7b1cd4b70e9736e621052f60d625  libpfm-4.6.0.tar.gz
-md5  5077b9022440e4951d96f2d0e73bd487  libpfm-4.6.0.tar.gz
+sha1  3a7b556e0778fd76e9e7abb06e5d4d2599ffbefc  libpfm-4.9.0.tar.gz
+md5  42ad4a2e5b8e1f015310db8535739c73  libpfm-4.9.0.tar.gz
 # Locally calculated
-sha256  5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f  libpfm-4.6.0.tar.gz
+sha256  db0fbe8ee28fd9beeb5d3e80b7cb3b104debcf6a9fcf5cb8b882f0662c79e4e2  libpfm-4.9.0.tar.gz
+sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 913fc35831..88632f478b 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.6.0
+LIBPFM4_VERSION = 4.9.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
-- 
2.14.1
