From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:34 +0200
Subject: [Buildroot] [PATCH 03/21] package/dtv-scan-tables: bump version
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <6d42eb217e609fe87b8dbca54739aac981b0b80b.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

New scan tables, and updates to existing ones.
Update upstream URL at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dtv-scan-tables/dtv-scan-tables.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index db7fb91..9d85325 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 7809ca1c04e688f35d09b8c1b2ac9b8ef4865322
-DTV_SCAN_TABLES_SITE = http://linuxtv.org/git/dtv-scan-tables.git
+DTV_SCAN_TABLES_VERSION = 1246b27f8b45f84c1824925060ad931530542f2e
+DTV_SCAN_TABLES_SITE = http://git.linuxtv.org/cgit.cgi/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
 # This package only contains the transponders data. This is not a 'work'
-- 
1.8.3.2
