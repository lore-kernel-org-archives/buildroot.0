From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:13:37 +0200
Subject: [Buildroot] [git commit] package/dropbear: rework license
 information
Message-ID: <20190530221402.B5374812E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7f136305013d95612ac06dc8622a463383e821a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the LICENSE file curve25519-donna is licensed under
BSD-3-Clause license.

There is only BSD-2-Clause license mentioned so remove
BSD-2-Clause-like.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e10c851606..9c995c3894 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,7 @@
 DROPBEAR_VERSION = 2019.78
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
