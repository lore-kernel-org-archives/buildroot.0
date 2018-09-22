From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 22 Sep 2018 12:56:24 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/python-numpy: add host variant
 for piglit
Message-ID: <20180922105626.22626-1-romain.naour@gmail.com>
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
index bd5fe7e6a9..c454888288 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -31,3 +31,4 @@ endef
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.14.4
