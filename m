From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-certifi: bump to version 2017.1.23
Message-ID: <20170302205922.DF2107FBE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed7a011fd6a3de8277a2d9752884a6c7d8e2bb1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 443cc6d..ab0e373 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/certifi/json, sha256 locally computed
-md5	baa81e951a29958563689d868ef1064d  certifi-2016.9.26.tar.gz
-sha256	8275aef1bbeaf05c53715bfc5d8569bd1e04ca1e8e69608cc52bcaac2604eb19  certifi-2016.9.26.tar.gz
+md5 b72521a8badff5e89a8eabea586d79ab certifi-2017.1.23.tar.gz
+sha256 81877fb7ac126e9215dfb15bfef7115fdc30e798e0013065158eed0707fd99ce certifi-2017.1.23.tar.gz
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index f69e7c1..3f83194 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2016.9.26
+PYTHON_CERTIFI_VERSION = 2017.1.23
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/4f/75/e1bc6e363a2c76f8d7e754c27c437dbe4086414e1d6d2f6b2a3e7846f22b
+PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/b6/fa/ca682d5ace0700008d246664e50db8d095d23750bb212c0086305450c276
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
