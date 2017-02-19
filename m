From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:21 -0500
Subject: [Buildroot] [PATCH 24/58] python-mbstrdecoder: bump to version 0.2.2
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-25-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index 1389ac3..389bc49 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/mbstrdecoder/json, sha256 locally computed
-md5	5548c4748cf0bc16befcf7ef848f95ff  mbstrdecoder-0.1.0.tar.gz
-sha256	7c65c4ea6681729ddfdb7612ac39f5accb10abb4e838ca810d810931ec023aad  mbstrdecoder-0.1.0.tar.gz
+md5 f528c26e537fe5c6987d5c5ccf6ab6e0 mbstrdecoder-0.2.2.tar.gz
+sha256 fe6412d8f796fc86c90a5d394a2c93adc05a3e4225986494665a43c65dcc9312 mbstrdecoder-0.2.2.tar.gz
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index f64bde9..8eb36e7 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 0.1.0
+PYTHON_MBSTRDECODER_VERSION = 0.2.2
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://pypi.python.org/packages/e4/10/fa3d8716b28e2b37eba1edab1c6831a56b805032328279c14fc99d37c391
+PYTHON_MBSTRDECODER_SITE = https://pypi.python.org/packages/40/17/ea4f3a4c844e3e5a112408879c02a1c0517ab07f97a070afe992d98d1a1a
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
-- 
2.9.3
