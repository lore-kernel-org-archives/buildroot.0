From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:48:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/flex: set FLEX_CPE_ID_VALID
Message-ID: <20210117154813.349890-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:flex_project:flex is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aflex_project%3Aflex

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flex/flex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 6ce768c318..52a15ca497 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,6 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
+FLEX_CPE_ID_VALID = YES
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 HOST_FLEX_DEPENDENCIES = host-m4
 
-- 
2.29.2
