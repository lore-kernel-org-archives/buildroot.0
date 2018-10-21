From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:58:03 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] nmap: update license
Message-ID: <20181021125653.E6AA888221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79393851f96fd962e2af1b5d30a033dcf628e85e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

nmap is licensed under GPL-2.0 but with additional restrictions (see
COPYING, especially the "IMPORTANT NMAP LICENSE TERMS" part).

So, following advices of Yann and Arnout (see
https://patchwork.ozlabs.org/patch/979081), set license to nmap license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f6199d3654d0a78d8ac5557679086e8618132854)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index ceb08ec006..f776660863 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -11,7 +11,7 @@ NMAP_DEPENDENCIES = libpcap pcre host-autoconf
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
 	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
-NMAP_LICENSE = GPL-2.0
+NMAP_LICENSE = nmap license
 NMAP_LICENSE_FILES = COPYING
 
 # nmap doesn't autoreconf properly, so we just re-generate the
