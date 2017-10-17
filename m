From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 17 Oct 2017 15:21:54 +0200
Subject: [Buildroot] [PATCH 1/1] qpdf: bump version to 7.0.0
Message-ID: <20171017132154.14192-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/qpdf/qpdf.hash | 6 +++---
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index c882708b52..29abc0692b 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/qpdf/files/qpdf/6.0.0/qpdf-6.0.0.sha1/download
-sha1	15ebe09d9b9ddd2309a67e4295693fcf82494e33	qpdf-6.0.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/7.0.0/qpdf-7.0.0.sha512/download
+#sha512	7b52d67b4d2c428a7b0c1cd03b03a23f05d38d7e3c81041079a137919019ea5158f12bf95fdcfcff6b43ffdefe93a85127ced2a363a6b4b380cbaa02a3840256  qpdf-7.0.0.tar.gz
 # Locally computed
-sha256	a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f66062cf7f9c4155233	qpdf-6.0.0.tar.gz
+#sha256	fed08de14caad0fe5efd148d9eca886d812588b2cbb35d13e61993ee8eb8c65f  qpdf-7.0.0.tar.gz
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 9601f98542..5b775401a6 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 6.0.0
+QPDF_VERSION = 7.0.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
-- 
2.11.0
