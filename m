From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Jun 2016 12:09:15 +0200
Subject: [Buildroot] [PATCH 2/5] python-txaio: bump to version 2.5.1
In-Reply-To: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
References: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1465985358-12555-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 5d9e6cf..37da82b 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c2a7e6ebfdf8987c3938e40e39a3c5e7, sha256 locally computed
-md5	c2a7e6ebfdf8987c3938e40e39a3c5e7  txaio-2.2.1.tar.gz
-sha256	6eee00c397d8193d15313dfc36da3eac8d64edf0b92fe3b67cd5a735ffc3074b  txaio-2.2.1.tar.gz
+# md5 from https://pypi.python.org/pypi/txaio/json, sha256 locally computed.
+md5	7b0f5321515d380ad5d32f01666b6ee7  txaio-2.5.1.tar.gz
+sha256	625076477182e2dde78b79d0b2b0d6b3cecb0e24fe0ea7eaf2abd26a4c0dd1de  txaio-2.5.1.tar.gz
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 127bc62..34c6e99 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 2.2.1
+PYTHON_TXAIO_VERSION = 2.5.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = http://pypi.python.org/packages/source/t/txaio
+PYTHON_TXAIO_SITE = https://pypi.python.org/packages/45/e1/f7d88767d65dbfc20d4b4aa0dad657dbbe8ca629ead2bef24da04630a12a
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
-- 
2.8.1
