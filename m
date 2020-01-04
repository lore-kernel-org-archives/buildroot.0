From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 20:50:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.2
Message-ID: <20200104195004.145031-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 39014331e6..1000167611 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7b40f5605dd972108f503f031b20186f5e5bca2b65cd4b8bd6c3e4ba8126697  jsoncpp-1.9.1.tar.gz
+sha256  77a402fb577b2e0e5d0bdc1cf9c65278915cdb25171e3452c68b6da8a561f8f0  jsoncpp-1.9.2.tar.gz
 sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 11615b0228..50728601a4 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.1
+JSONCPP_VERSION = 1.9.2
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.20.1
