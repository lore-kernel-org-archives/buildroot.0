From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 15:04:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/nmap: add NMAP_CPE_ID_VENDOR
Message-ID: <20210302140454.364845-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nmap:nmap is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anmap%3Anmap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmap/nmap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index aed278ccba..13414a56ee 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -12,6 +12,7 @@ NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included
 NMAP_LICENSE = nmap license
 NMAP_LICENSE_FILES = LICENSE
+NMAP_CPE_ID_VENDOR = nmap
 NMAP_SELINUX_MODULES = netutils
 
 # needed by libpcap
-- 
2.30.0
