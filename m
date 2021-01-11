From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 09:07:00 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/quota: add CPE variables
Message-ID: <20210111080700.1285185-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Move vendor before name

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
 
-- 
2.29.2
