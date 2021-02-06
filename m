From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:51:25 +0100
Subject: [Buildroot] [git commit] package/asterisk: add CPE variables
Message-ID: <20210206133111.8343F81542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2ef0347c5fd48c44a42eeb13da9dd53cff308fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:asterisk:open_source is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aasterisk%3Aopen_source

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index fb3eb6ec8a..b220b54189 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -21,6 +21,9 @@ ASTERISK_LICENSE_FILES = \
 	codecs/speex/speex_resampler.h \
 	utils/db1-ast/include/db.h
 
+ASTERISK_CPE_ID_VENDOR = asterisk
+ASTERISK_CPE_ID_PRODUCT = open_source
+
 # For patches 0002, 0003 and 0005
 ASTERISK_AUTORECONF = YES
 ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
