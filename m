From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 12:31:39 +0100
Subject: [Buildroot] [git commit] libcgicc: bump to version 3.2.16
Message-ID: <20141209133124.1CCFE800B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66eece01cfbce2da44a9d28ce7d4a26149f5e078
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcgicc/libcgicc.hash |    2 ++
 package/libcgicc/libcgicc.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
new file mode 100644
index 0000000..313478d
--- /dev/null
+++ b/package/libcgicc/libcgicc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d94a2b5dec6d5eb6f05f114e2c7a64aeb7da71708ebe7b5f32bd6ebde1dfbc96	cgicc-3.2.16.tar.bz2
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 447b2a5..1c36d42 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.15
+LIBCGICC_VERSION = 3.2.16
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
-LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.bz2
 LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
 LIBCGICC_LICENSE_FILES = COPYING.LIB COPYING.DOC
 LIBCGICC_INSTALL_STAGING = YES
