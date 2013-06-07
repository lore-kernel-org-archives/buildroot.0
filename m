From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  7 Jun 2013 09:54:11 +0200
Subject: [Buildroot] [PATCH 2/4] Fix package headers to comply with coding
	style
In-Reply-To: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1370591655-19855-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 fs/cramfs/cramfs.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 6549f39..4f737dd 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -3,6 +3,7 @@
 # Build the cramfs root filesystem image
 #
 #############################################################
+
 ifeq ($(BR2_ENDIAN),"BIG")
 CRAMFS_OPTS=-b
 else
-- 
1.7.9.5
