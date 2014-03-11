From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:01:47 +0100
Subject: [Buildroot] [git commit] nmap: bump to version 6.40
Message-ID: <20140311220647.7267D9BEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11ae97c1abeaba5779796ae86d21841e044d111a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
