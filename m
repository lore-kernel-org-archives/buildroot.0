From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:21 -0600
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/boa/boa.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index d8bcaa1..1ded702 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -8,7 +8,7 @@ BOA_VERSION = 0.94.14rc21
 BOA_SITE = http://www.boa.org
 BOA_LICENSE = GPL-2.0+
 BOA_LICENSE_FILES = COPYING
-
+BOA_CPE_ID = $(BOE_NAME):$(BOE_NAME):$(BOE_VERSION)
 define BOA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
 	$(INSTALL) -D -m 755 $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
-- 
1.9.1
