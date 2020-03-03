From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Mar 2020 20:47:00 +0100
Subject: [Buildroot] [PATCH 2/5] package/patch: annotate CVE-2018-1000156
In-Reply-To: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
References: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303194703.242362-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/patch/patch.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index ca54beab6d..483e2791a3 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -13,6 +13,9 @@ PATCH_LICENSE_FILES = COPYING
 # 0001-Fix-segfault-with-mangled-rename-patch.patch
 PATCH_IGNORE_CVES += CVE-2018-6951
 
+# 0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
+PATCH_IGNORE_CVES += CVE-2018-1000156
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
-- 
2.25.0
