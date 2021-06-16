From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jun 2021 07:42:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/snort3: bump to version 3.1.5.0
Message-ID: <20210616054214.230008-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/snort3/snort3/releases/tag/3.1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 48eddd74c9..86cf0b1242 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  a68af8ea46a038dfb0ad489e8d11dee62a3e63cb4a639f6bb4fac4ded955fe11  snort3-3.1.4.0.tar.gz
+sha256  9209ca675c55e1c9dee1cb15e571b29c317f6e167b54f22e7bc18a6164218b1b  snort3-3.1.5.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 1c49da8ec0..1f234e250c 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.4.0
+SNORT3_VERSION = 3.1.5.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.30.2
