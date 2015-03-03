From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 18:16:23 +0100
Subject: [Buildroot] [PATCH 1/1] agentpp: update URL address
Message-ID: <1425402983-22692-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/agentpp/agentpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 3d95ff4..29d809e 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -6,7 +6,7 @@
 
 AGENTPP_VERSION = 4.0.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
-AGENTPP_SITE = http://www.agentpp.com
+AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
-- 
1.9.1
