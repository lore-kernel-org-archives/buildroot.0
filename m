From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:46:29 +0200
Subject: [Buildroot] [git commit] package/python-markdown: bump to version
 3.1.1
Message-ID: <20191005150349.C7F5788454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1238813ce14d905fe471f709b42404706d88705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 623156b509..6eff2035bb 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5	72219f46ca440b657bf227500731bdf1  Markdown-3.0.1.tar.gz
-sha256	d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c  Markdown-3.0.1.tar.gz
+md5	d84732ecc65b3a1bff693d9d4c24277f  Markdown-3.1.1.tar.gz
+sha256	2e50876bcdd74517e7b71f3e7a76102050edec255b3983403f1a63e7c8a41e7a  Markdown-3.1.1.tar.gz
 # Locally computed sha256
 sha256	6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 8349638eb3..a8311168f5 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.0.1
+PYTHON_MARKDOWN_VERSION = 3.1.1
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/ac/df/0ae25a9fd5bb528fe3c65af7143708160aa3b47970d5272003a1ad5c03c6
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
