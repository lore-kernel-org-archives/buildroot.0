From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Sep 2019 10:03:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/apitrace: bump to version 8.0
Message-ID: <20190908080322.5703-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apitrace/apitrace.hash | 3 ++-
 package/apitrace/apitrace.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
index 1daaa46e84..c6086da5f4 100644
--- a/package/apitrace/apitrace.hash
+++ b/package/apitrace/apitrace.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 0aae8902696ad23ba91d61c57007861a3f6e3c2d4f0f43b783b4b7a58e3f9172  apitrace-15d7f975f9688372467ebd63d2a57d3957823f93.tar.gz
+sha256 45f61fb4859606ee54ebfd7dd8a4dedce18b9fe8a2523bbd23526bd9413b6b6c  apitrace-8.0.tar.gz
+sha256 7066bb1b787519c42f8278b77757c21de522cd97755cb30a22759ac401c62260  LICENSE
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index c66f6b3e38..3a3d1c9a82 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APITRACE_VERSION = 15d7f975f9688372467ebd63d2a57d3957823f93
+APITRACE_VERSION = 8.0
 APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
-- 
2.23.0.rc1
