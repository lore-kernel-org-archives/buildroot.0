From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 05 Oct 2013 12:31:52 +0800
Subject: [Buildroot] [PATCH 2/2] proxychains-ng: bump to version 4.6
In-Reply-To: <1380947459.27085.0.camel@phoenix>
References: <1380947459.27085.0.camel@phoenix>
Message-ID: <1380947512.27085.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/proxychains-ng/proxychains-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index cc3e357..7c2ffbf 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.4
+PROXYCHAINS_NG_VERSION = 4.6
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
-- 
1.8.1.2
