From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 20:18:54 +0100
Subject: [Buildroot] [git commit] package/putty: add PUTTY_CPE_ID_VENDOR
Message-ID: <20210301185648.45D6186842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cc2fcee3accba39a57c5a63383579a5a71108da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:putty:putty is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aputty%3Aputty

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 8f9564bc38..c40cac9dc5 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -8,6 +8,7 @@ PUTTY_VERSION = 0.74
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
+PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
 PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
