From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Aug 2014 18:47:25 -0300
Subject: [Buildroot] [PATCH 3/3] nmap: bump to version 6.47
In-Reply-To: <1409089645-23216-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409089645-23216-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409089645-23216-3-git-send-email-gustavo@zacarias.com.ar>
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
index 40e381a..3ba6f1a 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 6.46
+NMAP_VERSION = 6.47
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
-- 
1.8.5.5
