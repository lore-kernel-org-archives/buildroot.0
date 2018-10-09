From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:54:28 +0200
Subject: [Buildroot] [git commit] package/python-numpy: add host variant for
 piglit
Message-ID: <20181009200315.122F18188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=714ca37c7622971fe8f5169391647bd4b7736894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-numpy is required by piglit buildsystem for crosscompiling.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
