From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:46:33 +0100
Subject: [Buildroot] [git commit] package/python-cchardet: bump to version
 2.1.5
Message-ID: <20191129093832.6095382671@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2da1130670447e38d94609c076e99f55352c5da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index 231804ee3c..d023457854 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5	17af20af67cb18e958854e273d857a88  cchardet-2.1.4.tar.gz
-sha256	cc9745e0400da4cfb49f075e7819f22473b66443f953427058fee2c7b9547cc0  cchardet-2.1.4.tar.gz
+md5	681af4e6546e47e2ae856057a8a7d105  cchardet-2.1.5.tar.gz
+sha256	240efe3f255f916769458343840b9c6403cf3192720bc5129792cbcb88bf72fb  cchardet-2.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256	107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 9ac170c22d..58082538d0 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.4
+PYTHON_CCHARDET_VERSION = 2.1.5
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/74/64/3988d388315c1af3e24f447689dadf30edead43366fb2041cb103380b57f
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/73/25/73649708a30aa97124631bd088a22f1bf721d05d4e72fb9cc9bedb97de51
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
