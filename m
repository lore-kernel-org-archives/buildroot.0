From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Aug 2020 10:36:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-decorator: drop host variant
Message-ID: <20200810083609.325356-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop host variant of python-decorator as it is not used by any package
since commit d4a0dc5d571cac4f12399d78617db4ff8e55ae12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-decorator/python-decorator.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index e555f01ba1..ea56b786c4 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -13,4 +13,3 @@ PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-$(eval $(host-python-package))
-- 
2.27.0
