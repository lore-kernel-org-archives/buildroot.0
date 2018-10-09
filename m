From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 08:53:16 +0200
Subject: [Buildroot] [git commit] nmap: update license
Message-ID: <20181009065213.382618E56E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6199d3654d0a78d8ac5557679086e8618132854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nmap is licensed under GPL-2.0 but with additional restrictions (see
COPYING, especially the "IMPORTANT NMAP LICENSE TERMS" part).

So, following advices of Yann and Arnout (see
https://patchwork.ozlabs.org/patch/979081), set license to nmap license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nmap/nmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 420aec82d7..8809d4c037 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included
-NMAP_LICENSE = GPL-2.0
+NMAP_LICENSE = nmap license
 NMAP_LICENSE_FILES = COPYING
 
 # needed by libpcap
