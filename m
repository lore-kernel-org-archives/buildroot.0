From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:29 +0200
Subject: [Buildroot] [git commit] package/python-certifi: bump version to
	2016.9.26
Message-ID: <20161005210757.E4F607FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97562dd098f2e977a81ebd08a81caf8f6946bdcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ade4db3..443cc6d 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5d672aa766e1f773c75cfeccd02d3650, sha256 locally computed
-md5   5d672aa766e1f773c75cfeccd02d3650  certifi-2016.2.28.tar.gz
-sha256  5e8eccf95924658c97b990b50552addb64f55e1e3dfe4880456ac1f287dc79d0  certifi-2016.2.28.tar.gz
+# md5 from https://pypi.python.org/pypi/certifi/json, sha256 locally computed
+md5	baa81e951a29958563689d868ef1064d  certifi-2016.9.26.tar.gz
+sha256	8275aef1bbeaf05c53715bfc5d8569bd1e04ca1e8e69608cc52bcaac2604eb19  certifi-2016.9.26.tar.gz
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 84db8ff..f69e7c1 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2016.2.28
+PYTHON_CERTIFI_VERSION = 2016.9.26
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/4f/75/e1bc6e363a2c76f8d7e754c27c437dbe4086414e1d6d2f6b2a3e7846f22b
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
