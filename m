From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-dominate: bump to version
 2.4.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-13-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dominate/python-dominate.hash | 8 +++++---
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 2480b004be..168e56e740 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/dominate/json, sha256 locally computed
-md5     45bd97e6f7888aac24ae86013c57638e  dominate-2.3.1.tar.gz
-sha256  4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69  dominate-2.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dominate/json
+md5	27d3aa7e0d67902c505e248e705e5e2e  dominate-2.4.0.tar.gz
+sha256	a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c  dominate-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 70ddb06796..e87b6842dd 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.3.1
+PYTHON_DOMINATE_VERSION = 2.4.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://pypi.python.org/packages/43/b2/3b7d67dd59dab93ae08569384b254323516e8868b453eea5614a53835baf
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/46/dd/0fde17069c908951941475eee110c84467591caa1cd8ca30136294c26621
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
