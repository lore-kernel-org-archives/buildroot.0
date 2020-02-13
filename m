From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:15:34 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-markdown: bump to version
 3.2.1
Message-ID: <20200213051534.53563-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 6eff2035bb..8c72072432 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5	d84732ecc65b3a1bff693d9d4c24277f  Markdown-3.1.1.tar.gz
-sha256	2e50876bcdd74517e7b71f3e7a76102050edec255b3983403f1a63e7c8a41e7a  Markdown-3.1.1.tar.gz
+md5	7a894dc55992b37cdbcba5c4049455fc  Markdown-3.2.1.tar.gz
+sha256	90fee683eeabe1a92e149f7ba74e5ccdc81cd397bd6c516d93a8da0ef90b6902  Markdown-3.2.1.tar.gz
 # Locally computed sha256
 sha256	6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index a8311168f5..1f352fd7f1 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.1.1
+PYTHON_MARKDOWN_VERSION = 3.2.1
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/ac/df/0ae25a9fd5bb528fe3c65af7143708160aa3b47970d5272003a1ad5c03c6
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/98/79/ce6984767cb9478e6818bd0994283db55c423d733cc62a88a3ffb8581e11
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.20.1
