From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Mar 2021 22:57:34 +0100
Subject: [Buildroot] [git commit] package/python-dialog3: switch to
 setuptools
Message-ID: <20210327220906.3C42E86FC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2af9ab7c31a67fbbd6008fd82878fc1019dfbe94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package switched to setuptools (see commit:
https://github.com/frougon/pythondialog/commit/88a3f0b45e81aaecf3a85bcf8b8d8ce907fbe29d)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-dialog3/python-dialog3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index e2147507bf..6051985640 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -9,7 +9,7 @@ PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.gz
 PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/72/3c/26ed0db035f97196704d0197d8b2254b8a6ca93a2d132430b0b0d597aa79
 PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
-PYTHON_DIALOG3_SETUP_TYPE = distutils
+PYTHON_DIALOG3_SETUP_TYPE = setuptools
 PYTHON_DIALOG3_DEPENDENCIES = dialog
 
 $(eval $(python-package))
