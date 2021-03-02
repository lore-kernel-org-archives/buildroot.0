From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:48 +0100
Subject: [Buildroot] [git commit] package/nmap: add NMAP_CPE_ID_VENDOR
Message-ID: <20210302201930.0B6228349A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=258373d19e0b7e3a2a1c43882a4fdd648a4a5954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:nmap:nmap is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anmap%3Anmap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
