From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 12:59:33 +0100
Subject: [Buildroot] [git commit] python-sortedcontainers: bump to version
 2.1.0
Message-ID: <20181202071558.9C44582855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87a5937a88de130ea9bf0c8a8b59086238b2c362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sortedcontainers/python-sortedcontainers.hash | 4 ++--
 package/python-sortedcontainers/python-sortedcontainers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
index c68d78a176..311bb77e17 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.hash
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sortedcontainers/json
-md5	5f079b1131d8b1a3ed025e7e679b1497  sortedcontainers-2.0.5.tar.gz
-sha256	b74f2756fb5e23512572cc76f0fe0832fd86310f77dfee54335a35fb33f6b950  sortedcontainers-2.0.5.tar.gz
+md5	41a4a1eaf7b85e6b3beb14cfb160bc27  sortedcontainers-2.1.0.tar.gz
+sha256	974e9a32f56b17c1bac2aebd9dcf197f3eb9cd30553c5852a3187ad162e1a03a  sortedcontainers-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	7dcf4a5137118a925727b8a1690bc6ea70b156ee6739dbb51fd4d386718d6ce5  LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index c32f9e4047..43f662a89f 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SORTEDCONTAINERS_VERSION = 2.0.5
+PYTHON_SORTEDCONTAINERS_VERSION = 2.1.0
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/b9/30/accbf5c09c5fa25a3d5f762761e0d7ece6fdb12f2a9c43b840f73cef43ef
+PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/29/e0/135df2e733790a3d3bcda970fd080617be8cea3bd98f411e76e6847c17ef
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
