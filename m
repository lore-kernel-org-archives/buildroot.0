From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Oct 2018 19:27:30 +0200
Subject: [Buildroot] [PATCH 1/1] nmap: update license
Message-ID: <20181004172730.12889-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nmap is licensed under GPL-2.0 but with exceptions or a commercial
license (see COPYING, especially the "IMPORTANT NMAP LICENSE TERMS"
part)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmap/nmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 420aec82d7..6b7502b02b 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included
-NMAP_LICENSE = GPL-2.0
+NMAP_LICENSE = GPL-2.0 with exceptions or commercial
 NMAP_LICENSE_FILES = COPYING
 
 # needed by libpcap
-- 
2.17.1
