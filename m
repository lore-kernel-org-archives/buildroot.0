From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-markdown: bump to version 2.6.8
Message-ID: <20170302205923.A4EBA7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46f3fa1bb03b7b36fd6ef13fc43397f75401d776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index d30faae..f2131ed 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/markdown/json, sha256 locally computed
-md5	a06f1c5d462b32e0e8da014e9eebb0d9  Markdown-2.6.7.tar.gz
-sha256	daebf24846efa7ff269cfde8c41a48bb2303920c7b2c7c5e04fa82e6282d05c0  Markdown-2.6.7.tar.gz
+md5 d9ef057a5bd185f6f536400a31fc5d45 Markdown-2.6.8.tar.gz
+sha256 0ac8a81e658167da95d063a9279c9c1b2699f37c7c4153256a458b3a43860e33 Markdown-2.6.8.tar.gz
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index fb87ada..6968366 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 2.6.7
+PYTHON_MARKDOWN_VERSION = 2.6.8
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://pypi.python.org/packages/d4/32/642bd580c577af37b00a1eb59b0eaa996f2d11dfe394f3dd0c7a8a2de81a
+PYTHON_MARKDOWN_SITE = https://pypi.python.org/packages/1d/25/3f6d2cb31ec42ca5bd3bfbea99b63892b735d76e26f20dd2dcc34ffe4f0d
 PYTHON_MARKDOWN_LICENSE = BSD-3c
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = distutils
