From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Mar 2020 02:30:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-cchardet: bump to version
 2.1.6
Message-ID: <20200326083004.34589-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cchardet/python-cchardet.hash | 6 +++---
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index d023457854..960801f889 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5	681af4e6546e47e2ae856057a8a7d105  cchardet-2.1.5.tar.gz
-sha256	240efe3f255f916769458343840b9c6403cf3192720bc5129792cbcb88bf72fb  cchardet-2.1.5.tar.gz
+md5  ee884e2c7762e56e8a0600aa34ad4fa3  cchardet-2.1.6.tar.gz
+sha256  b76afb2059ad69eab576949980a17413c1e9e5a5624abf9e43542d8853f146b3  cchardet-2.1.6.tar.gz
 # Locally computed sha256 checksums
-sha256	107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
+sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 58082538d0..78daf6075e 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.5
+PYTHON_CCHARDET_VERSION = 2.1.6
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/73/25/73649708a30aa97124631bd088a22f1bf721d05d4e72fb9cc9bedb97de51
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/41/e6/2e2184a3bc887bfb6e6b97aef5e94af9b8de43806ce14b023ddbbcb0b30d
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
-- 
2.20.1
