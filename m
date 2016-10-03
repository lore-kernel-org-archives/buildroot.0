From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:36 +0200
Subject: [Buildroot] [PATCH 16/28] package/python-markdown: bump version to
	2.6.7
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-markdown/python-markdown.hash | 5 +++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index f1ffaae..d30faae 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  284e97e56db9ada03ede9c0ed2870ca6590ce7869f3119104d53510debf1533d  Markdown-2.5.2.tar.gz
+# md5 from https://pypi.python.org/pypi/markdown/json, sha256 locally computed
+md5	a06f1c5d462b32e0e8da014e9eebb0d9  Markdown-2.6.7.tar.gz
+sha256	daebf24846efa7ff269cfde8c41a48bb2303920c7b2c7c5e04fa82e6282d05c0  Markdown-2.6.7.tar.gz
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 3b2217e..fb87ada 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 2.5.2
+PYTHON_MARKDOWN_VERSION = 2.6.7
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = http://pypi.python.org/packages/source/M/Markdown
+PYTHON_MARKDOWN_SITE = https://pypi.python.org/packages/d4/32/642bd580c577af37b00a1eb59b0eaa996f2d11dfe394f3dd0c7a8a2de81a
 PYTHON_MARKDOWN_LICENSE = BSD-3c
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = distutils
-- 
2.9.3
