From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 17:39:13 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/tini: add
 TINI_CPE_ID_VENDOR
Message-ID: <20210519151137.B808088577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ed1c31c828c18c212b2c1c98922a6fa4f7ce2bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tini_project:tini is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atini_project%3Atini

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b074ef1f32c16fd3433f54a822527032b71b1a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index af4a3bcb5e..9da54f8a25 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -8,6 +8,7 @@ TINI_VERSION = 0.19.0
 TINI_SITE = $(call github,krallin,tini,v$(TINI_VERSION))
 TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
+TINI_CPE_ID_VENDOR = tini_project
 
 TINI_CFLAGS = $(TARGET_CFLAGS) \
 	-static \
