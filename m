From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Mar 2018 21:27:22 +0100
Subject: [Buildroot] [PATCH 1/1] jsoncpp: bump to version 1.8.4
Message-ID: <20180307202722.19514-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jsoncpp/jsoncpp.hash | 3 ++-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 09ceb58553..3391d9ecc3 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  3671ba6051e0f30849942cc66d1798fdf0362d089343a83f704c09ee7156604f  jsoncpp-1.8.3.tar.gz
+sha256  c49deac9e0933bcb7044f08516861a2d560988540b23de2ac1ad443b219afdb6  jsoncpp-1.8.4.tar.gz
+sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 6dfaecefdd..3a2ee087b3 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.8.3
+JSONCPP_VERSION = 1.8.4
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.14.1
