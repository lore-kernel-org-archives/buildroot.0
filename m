From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Dec 2014 10:10:36 +0100
Subject: [Buildroot] [PATCH 3/7] lpeg: bump to version 0.12.1
In-Reply-To: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
References: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1419412240-16068-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lpeg/lpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index a9759e5..52fb7b7 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 0.12-1
+LPEG_VERSION = 0.12.1-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.1.0
