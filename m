From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 15:26:16 +0100
Subject: [Buildroot] [PATCH v2,1/4] package/libyaml: add host variant
Message-ID: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-libyaml is needed for host-python-pyyaml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyaml/libyaml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 26e318736c..dc7368a168 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -12,3 +12,4 @@ LIBYAML_LICENSE = MIT
 LIBYAML_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.1
