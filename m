From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:58 +0100
Subject: [Buildroot] [git commit] package/jansson: add JANSSON_CPE_ID_VALID
Message-ID: <20210121204358.B603F812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9b24b3813cd576259e85ced26144e76ee54c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jansson_project:jansson is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajansson_project%3Ajansson

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jansson/jansson.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 83fb370160..4ac64b69ef 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -8,6 +8,7 @@ JANSSON_VERSION = 2.13.1
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
+JANSSON_CPE_ID_VALID = YES
 JANSSON_INSTALL_STAGING = YES
 JANSSON_CONF_ENV = LIBS="-lm"
 
