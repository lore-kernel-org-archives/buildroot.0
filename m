From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Sep 2019 23:02:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/jsoncpp: bump version to 1.9.1
In-Reply-To: <20190904210238.7585-1-bernd.kuhls@t-online.de>
References: <20190904210238.7585-1-bernd.kuhls@t-online.de>
Message-ID: <20190904210238.7585-2-bernd.kuhls@t-online.de>
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
index 3391d9ecc3..39014331e6 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c49deac9e0933bcb7044f08516861a2d560988540b23de2ac1ad443b219afdb6  jsoncpp-1.8.4.tar.gz
+sha256  c7b40f5605dd972108f503f031b20186f5e5bca2b65cd4b8bd6c3e4ba8126697  jsoncpp-1.9.1.tar.gz
 sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index d54b31a8d6..11615b0228 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.8.4
+JSONCPP_VERSION = 1.9.1
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.20.1
