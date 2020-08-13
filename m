From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:11:20 +0200
Subject: [Buildroot] [git commit] package/python-decorator: drop host variant
Message-ID: <20200813210541.37CF581559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5447754166c08251026be81954fe06d46f3da838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop host variant of python-decorator as it is not used by any package
since commit d4a0dc5d571cac4f12399d78617db4ff8e55ae12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
