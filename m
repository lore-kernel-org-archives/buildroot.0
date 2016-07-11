From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Jul 2016 09:54:35 +0200
Subject: [Buildroot] [PATCH 2/4] python-pytablewriter: bump to version 0.5.0
In-Reply-To: <1468223677-20192-1-git-send-email-yegorslists@googlemail.com>
References: <1468223677-20192-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1468223677-20192-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 8684fca..9c27aed 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json
-md5	173ec08d6e0ded5219abaa1cb906ce62  pytablewriter-0.1.6.tar.gz
+md5	7a28e4ddb8b59199e161b7ee9e97e3a3  pytablewriter-0.5.0.tar.gz
 # sha256 calculated by scanpypi
-sha256	7faee0d52b13048d89157a82c38a8fa19512df625572dd918b2f43944c034d2d  pytablewriter-0.1.6.tar.gz
+sha256	e939adec820e68ed1b7c2eddfba73ce82a88f315aa90c81e04af0229020bfb7c  pytablewriter-0.5.0.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 879102c..1de7a69 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.1.6
+PYTHON_PYTABLEWRITER_VERSION = 0.5.0
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/da/34/394aeb8850d17a5e93ab931bc9fda1fbf598fe14e443be040c04f92cd1e3
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/c8/01/e4b7f1d83434d268fe6a0aec2d8ad00515de042285e58533090cfd72904d
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.8.1
