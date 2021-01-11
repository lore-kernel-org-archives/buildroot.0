From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:19:45 +0100
Subject: [Buildroot] [git commit] package/quota: add CPE variables
Message-ID: <20210111210202.2B39C87015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d4d5c89d56fd9289c7e27899c4eff0161802a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jan_kara:linux_diskquota is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajan_kara%3Alinux_diskquota

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/quota.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 18502da9aa..ce7d3641fc 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -9,6 +9,8 @@ QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(Q
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
+QUOTA_CPE_ID_VENDOR = jan_kara
+QUOTA_CPE_ID_NAME = linux_diskquota
 QUOTA_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 QUOTA_CONF_OPTS = --disable-pie
 
