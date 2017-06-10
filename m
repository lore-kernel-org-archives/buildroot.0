From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 15:45:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.8.0
Message-ID: <20170610134507.20816-1-bernd.kuhls@t-online.de>
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
index 504357f16..ba5d64467 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  087640ebcf7fbcfe8e2717a0b9528fff89c52fcf69fa2a18cc2b538008098f97  jsoncpp-1.7.7.tar.gz
+sha256 5deb2462cbf0c0121c9d6c9823ec72fe71417e34242e3509bc7c003d526465bc  jsoncpp-1.8.0.tar.gz
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index a9694411c..b1e64dd30 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.7.7
+JSONCPP_VERSION = 1.8.0
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.11.0
