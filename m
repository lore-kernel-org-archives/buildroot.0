From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:12:55 +0200
Subject: [Buildroot] [git commit] sam-ba: add license information
Message-ID: <20130421211402.4066F9B783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f39b706b087865112e351503ee51c60e5c2453f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sam-ba/sam-ba.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 067bdf1..dba653e 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# sam-ba
+#
+#############################################################
+
 SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
 SAM_BA_VERSION = 2.12
 SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_LICENSE = BSD-like (partly binary-only)
+SAM_BA_LICENSE_FILES = doc/readme.txt
 
 define HOST_SAM_BA_EXTRACT_CMDS
         unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
