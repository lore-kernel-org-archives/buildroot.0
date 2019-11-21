From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 21 Nov 2019 08:52:10 +0100
Subject: [Buildroot] [PATCH] package/libupnp18: bump to version 1.8.6
Message-ID: <20191121075210.64613-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version fixes a runtime issue which crashes gerbera:
https://github.com/gerbera/gerbera/issues/522

The issue has been reported upstream:
https://github.com/mrjimenez/pupnp/pull/122

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnp18/libupnp18.hash | 6 +++---
 package/libupnp18/libupnp18.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
index 9d44bbf41b..68aee9ba62 100644
--- a/package/libupnp18/libupnp18.hash
+++ b/package/libupnp18/libupnp18.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.5/libupnp-1.8.5.tar.bz2.sha1
-sha1 4d687f8f7d6279fddc4c6faff7f5e3513e765d8a  libupnp-1.8.5.tar.bz2
+# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.6/libupnp-1.8.6.tar.bz2.sha1
+sha1 6132a949d7536dac835172609d1def1e7f2bd232  libupnp-1.8.6.tar.bz2
 # Locally computed:
-sha256	55c4c30543b4cdaff3ed3a1c72bf118173369e9009eeed0bbd6e2ae62c6f0e93	libupnp-1.8.5.tar.bz2
+sha256	65faf240f8ccee50cc0e7fe7fb21dcd79f743fc227a9b652b091f50f6956c2c7	libupnp-1.8.6.tar.bz2
 sha256	c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3	COPYING
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index fef5fea809..ca82a54413 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP18_VERSION = 1.8.5
+LIBUPNP18_VERSION = 1.8.6
 LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
 LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
 LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
2.24.0
