From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Jan 2015 15:09:58 +0100
Subject: [Buildroot] [PATCH] agentpp: bump to 4.0.3
Message-ID: <1421849398-9409-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/agentpp/agentpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index a1edbb0..3d95ff4 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.0.2
+AGENTPP_VERSION = 4.0.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com
 AGENTPP_LICENSE = Apache-2.0
-- 
1.9.1
