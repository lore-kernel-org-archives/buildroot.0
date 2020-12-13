From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 21:09:59 +0100
Subject: [Buildroot] [git commit] package/dtv-scan-tables: switch upstream
 location
Message-ID: <20201213195530.C89FF82B7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7bd3805bded7c840731956c97233b0607a78e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old git tree is unreachable now, switch to using the new one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dtv-scan-tables/dtv-scan-tables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 5933f16776..5fad615b6b 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DTV_SCAN_TABLES_VERSION = 6d019038cd04e837d9dd58701202c15924c1c654
-DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
+DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
 # This package only contains the transponders data. This is not a 'work'
