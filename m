From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 May 2014 13:52:28 -0300
Subject: [Buildroot] [PATCH 2/3] nmap: bump to version 6.46
In-Reply-To: <1399567949-3832-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399567949-3832-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399567949-3832-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nmap/nmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index c7e2225..40e381a 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 6.40
+NMAP_VERSION = 6.46
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
-- 
1.8.5.5
