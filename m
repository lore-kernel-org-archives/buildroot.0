From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:26 -0500
Subject: [Buildroot] [PATCH 29/58] python-prompt-toolkit: bump to version
	1.0.13
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-30-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 6 +++---
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 0211a96..f60fc08 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/prompt-toolkit/json, sha256 locally computed
-md5	f74cd8ac84176fac1cdb136843ccb0d6  prompt_toolkit-1.0.7.tar.gz
-sha256	ef0b8188179fe7d052161ed274b43e18f5a680ff84d01462293b327e1668d2ef  prompt_toolkit-1.0.7.tar.gz
+# md5 from https://pypi.python.org/pypi/prompt_toolkit/json, sha256 locally computed
+md5 427b496d2c147bd3819bc3a7f6e0d493 prompt_toolkit-1.0.13.tar.gz
+sha256 33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776 prompt_toolkit-1.0.13.tar.gz
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 7e85dcd..0b80681 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.7
+PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.13
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/dd/55/2fb4883d2b21d072204fd21ca5e6040faa253135554590d0b67380669176
+PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/23/be/4876b52d5cc159cbd4b0ff6e7aa419a26470849a43a8f647857a4a24467b
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3c
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.9.3
