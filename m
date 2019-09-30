From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:51 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 0.3.4
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-25-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 4 ++--
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 3127d20576..b0c7a5d270 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5	7ca6a849ea51929cfd44c4e5bc316b0e  pysmi-0.3.3.tar.gz
-sha256	4e35c2b935ba5a68e086d7781dae1b508c228a960279620d182e876448acf02f  pysmi-0.3.3.tar.gz
+md5	10a9dd140ad512eed9f37344df83ce9d  pysmi-0.3.4.tar.gz
+sha256	bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c  pysmi-0.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256	c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index a686b6fba7..2aee27b186 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 0.3.3
+PYTHON_PYSMI_VERSION = 0.3.4
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/71/32/182dd4fa0c4e20c2a14154d3133cc08374694c2518a7c5445a918332b113
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/52/42/ddaeb06ff551672b17b77f81bc2e26b7c6060b28fe1552226edc6476ce37
 PYTHON_PYSMI_SETUP_TYPE = setuptools
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.20.1
