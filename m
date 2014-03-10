From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:23 -0300
Subject: [Buildroot] [PATCH 03/14] nmap: bump to version 6.40
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nmap/nmap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 47e4cfc..4ed39bf 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-NMAP_VERSION = 6.01
+NMAP_VERSION = 6.40
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
 NMAP_CONF_OPT = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
-	--with-libpcre="$(STAGING_DIR)/usr"
+	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
 NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
-- 
1.8.3.2
