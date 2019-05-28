From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 28 May 2019 14:41:02 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add missing BSD-3-Clause
 license
Message-ID: <20190528124102.21981-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

According to the LICENSE file curve25519-donna is licensed under
BSD-3-Clause license.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dropbear/dropbear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e10c851606..c1a27f85c5 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,7 @@
 DROPBEAR_VERSION = 2019.78
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
+DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause, BSD-3-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
-- 
2.17.0
