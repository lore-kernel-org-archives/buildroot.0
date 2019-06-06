From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:32:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dropbear: rework
 license information
Message-ID: <20190606154048.172118271C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f654cabb4dc8fdf4f3da37a659d41ba989af536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

According to the LICENSE file curve25519-donna is licensed under
BSD-3-Clause license.

There is only BSD-2-Clause license mentioned so remove
BSD-2-Clause-like.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b7f136305013d95612ac06dc8622a463383e821a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a5a8243bd4..5f99a2208c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,7 @@
 DROPBEAR_VERSION = 2018.76
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
+DROPBEAR_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
