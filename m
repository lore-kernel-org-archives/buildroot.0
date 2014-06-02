From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 08:38:40 +0200
Subject: [Buildroot] [git commit] package/dtv-scan-tables: bump version
Message-ID: <20140602064039.107F19CE6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebfefc277de7e16b4fc53884063ead4ea3577008
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New scan tables, and updates to existing ones.
Update upstream URL at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtv-scan-tables/dtv-scan-tables.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
