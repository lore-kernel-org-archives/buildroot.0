From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:42:21 +0100
Subject: [Buildroot] [git commit] package/netatalk: set NETATALK_CPE_ID_VALID
Message-ID: <20210303122740.E12AC844EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=608632bfe89da46bcab5be52a25cae7c729d8e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:netatalk_project:netatalk is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetatalk_project%3Anetatalk

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 1214fc3bf5..afe87bb409 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -14,6 +14,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
+NETATALK_CPE_ID_VALID = YES
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
