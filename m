From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 10:28:41 +0200
Subject: [Buildroot] [git commit] package/sysdig: add SYSDIG_CPE_ID_VENDOR
Message-ID: <20210410080609.B28888184C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16770c8cb9df395038de05156ff8ac7a21270a66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sysdig:sysdig is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asysdig%3Asysdig

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysdig/sysdig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index bcbb5ce01e..08d93750ae 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -8,6 +8,7 @@ SYSDIG_VERSION = 0.23.1
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
+SYSDIG_CPE_ID_VENDOR = sysdig
 SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
