From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:23:06 +0200
Subject: [Buildroot] [git commit] libupnpp: bump to version 0.16.0
Message-ID: <20170922161619.0EB9180FDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab52259ea1406fd7ee83c20de3dca734dba985b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index c850740..f19e0b5 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.3.tar.gz.sha256
-sha256  c9c5af25bff3d99f0e76296a13e544cc04e70c85623e4c9869a25418caa9e7b7  libupnpp-0.15.3.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.16.0.tar.gz.sha256
+sha256  b34b179e69c46993cf360da9e85db646b03c15ab2927b19eb70e27bf3c359017  libupnpp-0.16.0.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 2e1d72f..4755b70 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.15.3
+LIBUPNPP_VERSION = 0.16.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPL-2.0+
 LIBUPNPP_LICENSE_FILES = COPYING
