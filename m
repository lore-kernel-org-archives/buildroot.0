From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:33:00 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 1.11.2
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-34-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE change: new copyright year.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index dbf8932956..feab3f056d 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5	e1346f31782d50401f81c2345b037076  wrapt-1.10.11.tar.gz
-sha256	d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6  wrapt-1.10.11.tar.gz
+md5	cc15c001b129f81eb2f79b15eb99ffe5  wrapt-1.11.2.tar.gz
+sha256	565a021fd19419476b9362b05eeaa094178de64f8361e44468f9e9d7843901e1  wrapt-1.11.2.tar.gz
 # Locally computed sha256 checksums
-sha256	b6d2e5d228202a11bc5e5988661fc5d8acc1ba4f27256c37e19029131a30b1f2  LICENSE
+sha256	e37c13f84fb3c9a54161b0fcf75f4d302fb86ce42cd6106147bda79e4197d9f2  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index dd8b9a58e4..91f9d7f52a 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.10.11
+PYTHON_WRAPT_VERSION = 1.11.2
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/a0/47/66897906448185fcb77fc3c2b1bc20ed0ecca81a0f2f88eda3fc5a34fc3d
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/23/84/323c2415280bc4fc880ac5050dddfb3c8062c2552b34c2e512eb4aa68f79
 PYTHON_WRAPT_SETUP_TYPE = distutils
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.20.1
