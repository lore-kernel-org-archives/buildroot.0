From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Oct 2018 21:19:58 +0300
Subject: [Buildroot] [PATCH 1/1] python-markdown: bump to version 3.0.1
In-Reply-To: <20181015181959.12446-1-asafka7@gmail.com>
References: <20181015181959.12446-1-asafka7@gmail.com>
Message-ID: <20181015181959.12446-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-markdown/python-markdown.hash | 8 +++++---
 package/python-markdown/python-markdown.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index f2131edaf3..623156b509 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/markdown/json, sha256 locally computed
-md5 d9ef057a5bd185f6f536400a31fc5d45 Markdown-2.6.8.tar.gz
-sha256 0ac8a81e658167da95d063a9279c9c1b2699f37c7c4153256a458b3a43860e33 Markdown-2.6.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/markdown/json
+md5	72219f46ca440b657bf227500731bdf1  Markdown-3.0.1.tar.gz
+sha256	d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c  Markdown-3.0.1.tar.gz
+# Locally computed sha256
+sha256	6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index d5273f97a4..8349638eb3 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 2.6.8
+PYTHON_MARKDOWN_VERSION = 3.0.1
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://pypi.python.org/packages/1d/25/3f6d2cb31ec42ca5bd3bfbea99b63892b735d76e26f20dd2dcc34ffe4f0d
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
-PYTHON_MARKDOWN_SETUP_TYPE = distutils
+PYTHON_MARKDOWN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.17.1
