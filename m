From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 11 Oct 2016 21:09:30 +0200
Subject: [Buildroot] [PATCH] package/jsoncpp: bump to version 1.7.7
Message-ID: <20161011190930.6589-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index e1768ed..504357f 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	4338c6cab8af8dee6cdfd54e6218bd0533785f552c6162bb083f8dd28bf8fbbe	jsoncpp-1.7.5.tar.gz
+sha256  087640ebcf7fbcfe8e2717a0b9528fff89c52fcf69fa2a18cc2b538008098f97  jsoncpp-1.7.7.tar.gz
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 83ce0a7..a969441 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.7.5
+JSONCPP_VERSION = 1.7.7
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.10.0
