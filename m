From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Feb 2018 17:21:34 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/python-numpy: add host variant
 for piglit
Message-ID: <20180211162136.15605-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-numpy is required by piglit buildsystem for crosscompiling.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-numpy/python-numpy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index d0d38371a3..35878ac129 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -31,3 +31,4 @@ endef
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.14.3
