From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:12 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-mbstrdecoder: bump to
 version 0.8.1
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 8 +++++---
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 389bc49c4d..b46f5d7cf9 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mbstrdecoder/json, sha256 locally computed
-md5 f528c26e537fe5c6987d5c5ccf6ab6e0 mbstrdecoder-0.2.2.tar.gz
-sha256 fe6412d8f796fc86c90a5d394a2c93adc05a3e4225986494665a43c65dcc9312 mbstrdecoder-0.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
+md5	6dd814b20e7c68c2da2afe5bf72a5e9d  mbstrdecoder-0.8.1.tar.gz
+sha256	dabfae008a6b3b78f09847c2a73e9e866f97dcd9b52f7ccadf3b05a10a3656e6  mbstrdecoder-0.8.1.tar.gz
+# Locally computed sha256 checksums
+sha256	7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 8eb36e791e..4400cd6731 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 0.2.2
+PYTHON_MBSTRDECODER_VERSION = 0.8.1
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://pypi.python.org/packages/40/17/ea4f3a4c844e3e5a112408879c02a1c0517ab07f97a070afe992d98d1a1a
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/fd/0f/11982e1321f484b5ec85bb3e03878c9636ca5328fbcbed8b25ecbd76fd44
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.20.1
