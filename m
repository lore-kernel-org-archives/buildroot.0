From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:00:10 +0100
Subject: [Buildroot] [git commit] package/bsdiff: add BSDIFF_CPE_ID_VENDOR
Message-ID: <20210117084212.DFC117FACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=751f38f5a4711b913070b79b2a77182fbc1961dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:daemonology:bsdiff is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adaemonology%3Absdiff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bsdiff/bsdiff.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 9030284a0a..97a1b3921d 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -9,6 +9,7 @@ BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
 BSDIFF_LICENSE = BSD-2-Clause
 BSDIFF_LICENSE_FILES = bsdiff.c
+BSDIFF_CPE_ID_VENDOR = daemonology
 
 define BSDIFF_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
