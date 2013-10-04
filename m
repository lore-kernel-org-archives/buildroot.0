From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 04 Oct 2013 16:09:12 +0800
Subject: [Buildroot] [PATCH 1/2] dmidecode: bump to version 2.12
Message-ID: <1380874152.7626.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/dmidecode/dmidecode.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 86a3be5..c53bd33 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 2.11
+DMIDECODE_VERSION = 2.12
 DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
 
 define DMIDECODE_BUILD_CMDS
-- 
1.8.1.2
