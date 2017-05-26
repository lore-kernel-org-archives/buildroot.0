From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 26 May 2017 08:14:21 -0500
Subject: [Buildroot] [PATCH v3 2/2] package/avrdude: bump to
	f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
In-Reply-To: <1495804461-33097-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1495804461-33097-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1495804461-33097-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
---

v2 -> v3
 - No change

v1 -> v2
 - New commit to use upstream bugfix
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index b2c6125..b203d4d 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b32128f4812d5e852cfba2e863d950ec30e0f72f09bc14fb41c02528bbc5dd18 avrdude-ad04c429a90f4c34f000ea4ae11db2705915a31f.tar.gz
+sha256 cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index c379707..0e34076 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = ad04c429a90f4c34f000ea4ae11db2705915a31f
+AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
-- 
1.9.1
