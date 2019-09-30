From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-simpleaudio: bump to version
 1.0.2
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-28-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-simpleaudio/python-simpleaudio.hash | 8 +++++---
 package/python-simpleaudio/python-simpleaudio.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-simpleaudio/python-simpleaudio.hash b/package/python-simpleaudio/python-simpleaudio.hash
index 7e3a7fb39b..353fa5e36c 100644
--- a/package/python-simpleaudio/python-simpleaudio.hash
+++ b/package/python-simpleaudio/python-simpleaudio.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/simpleaudio/json, sha256 locally computed
-md5     8c1c82fdf7ebba1a79b1243651e451d7 simpleaudio-1.0.1.tar.gz
-sha256  6cc84d50d8192c074505c719722138ae6ea987fd8eee7fd930237cb308962604  simpleaudio-1.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/simpleaudio/json
+md5	92f0a0891a198c000fedce0599b46c7b  simpleaudio-1.0.2.tar.gz
+sha256	4e0e4c0359f153408e9b8a65342ec0c1d014f36fbe9cdb594e9b6e5348916af8  simpleaudio-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256	b4340683e83f0f25ea40f992773ceec6c749c4d64ec2c09dfa49d7f5b029adbf  LICENSE.txt
diff --git a/package/python-simpleaudio/python-simpleaudio.mk b/package/python-simpleaudio/python-simpleaudio.mk
index 24ec067da4..e23d4d026b 100644
--- a/package/python-simpleaudio/python-simpleaudio.mk
+++ b/package/python-simpleaudio/python-simpleaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEAUDIO_VERSION = 1.0.1
+PYTHON_SIMPLEAUDIO_VERSION = 1.0.2
 PYTHON_SIMPLEAUDIO_SOURCE = simpleaudio-$(PYTHON_SIMPLEAUDIO_VERSION).tar.gz
-PYTHON_SIMPLEAUDIO_SITE = https://pypi.python.org/packages/12/f6/327c1af94062a6a6a5ff06dcf9dc689ed81aa07ae757cca3438c3c9e50fe
+PYTHON_SIMPLEAUDIO_SITE = https://files.pythonhosted.org/packages/ad/39/ce09ef827887cdfc755427195d7291446c1fb34a16356d1fec920d62269d
 PYTHON_SIMPLEAUDIO_LICENSE = MIT
 PYTHON_SIMPLEAUDIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEAUDIO_SETUP_TYPE = setuptools
-- 
2.20.1
