From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:33 +0200
Subject: [Buildroot] [PATCH 06/21] package/python-pytablewriter: bump
	version to 0.10.2
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pytablewriter/python-pytablewriter.hash | 7 +++----
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 9c27aed..09fb8ff 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pytablewriter/json
-md5	7a28e4ddb8b59199e161b7ee9e97e3a3  pytablewriter-0.5.0.tar.gz
-# sha256 calculated by scanpypi
-sha256	e939adec820e68ed1b7c2eddfba73ce82a88f315aa90c81e04af0229020bfb7c  pytablewriter-0.5.0.tar.gz
+# md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
+md5	1f63f9652c61c0d68f17dac054d2c923  pytablewriter-0.10.2.tar.gz
+sha256	9a45c632ffd94878153cb989ada412b7291100005ce40baaf33a3d4bd51708cf  pytablewriter-0.10.2.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 1de7a69..bf89d0a 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.5.0
+PYTHON_PYTABLEWRITER_VERSION = 0.10.2
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/c8/01/e4b7f1d83434d268fe6a0aec2d8ad00515de042285e58533090cfd72904d
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/eb/4f/ca66fd21db4d9ef81f8bb2012dece42a1f5239295df149a04d955e492fc5
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.9.3
