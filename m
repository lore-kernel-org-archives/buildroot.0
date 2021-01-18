From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:08 +0100
Subject: [Buildroot] [git commit] package/jquery: add JQUERY_CPE_ID_VENDOR
Message-ID: <20210118203943.89D26818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0937588f0c38f7935d34de3a00564574333d658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jquery:jquery is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajquery%3Ajquery

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jquery/jquery.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 88ab84fa05..8febed36ca 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -8,6 +8,7 @@ JQUERY_VERSION = 3.5.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
+JQUERY_CPE_ID_VENDOR = jquery
 
 define JQUERY_EXTRACT_CMDS
 	cp $(JQUERY_DL_DIR)/$(JQUERY_SOURCE) $(@D)
