From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:39:09 +0100
Subject: [Buildroot] [git commit] package/patch: annotate CVE-2018-1000156
Message-ID: <20200303212705.A0BA48F289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a953aac9596dbee1d5caffcc15d29eed8d87185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
