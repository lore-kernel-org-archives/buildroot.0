From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:18:00 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/sysstat: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.7D95A817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bde607aee4f628a18a63d1e4d3eddc19849cf13b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:sysstat_project:sysstat:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:sysstat_project:sysstat

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9b3ea504dbba780d22f7da0afa5a697d448297a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 7d254d6643..8ec4966813 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -11,6 +11,7 @@ SYSSTAT_CONF_OPTS = --disable-file-attr
 SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
+SYSSTAT_CPE_ID_VENDOR = sysstat_project
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
