From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:52 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-raven: bump to version 6.10.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-26-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-raven/python-raven.hash | 4 ++--
 package/python-raven/python-raven.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
index 1e451ba41d..6f264193ec 100644
--- a/package/python-raven/python-raven.hash
+++ b/package/python-raven/python-raven.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/raven/json
-md5	ba514edaca361a0edb476f76c959d8af  raven-6.9.0.tar.gz
-sha256	3fd787d19ebb49919268f06f19310e8112d619ef364f7989246fc8753d469888  raven-6.9.0.tar.gz
+md5	3676f31dadfa61526444dd0245c78a38  raven-6.10.0.tar.gz
+sha256	3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54  raven-6.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
index b822fcda78..ff6c22c00a 100644
--- a/package/python-raven/python-raven.mk
+++ b/package/python-raven/python-raven.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RAVEN_VERSION = 6.9.0
+PYTHON_RAVEN_VERSION = 6.10.0
 PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
-PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/8f/80/e8d734244fd377fd7d65275b27252642512ccabe7850105922116340a37b
+PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/79/57/b74a86d74f96b224a477316d418389af9738ba7a63c829477e7a86dd6f47
 PYTHON_RAVEN_SETUP_TYPE = setuptools
 PYTHON_RAVEN_LICENSE = BSD-3-Clause
 PYTHON_RAVEN_LICENSE_FILES = LICENSE
-- 
2.20.1
