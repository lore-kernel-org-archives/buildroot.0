From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:59:03 +0200
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.7.4.post0
Message-ID: <20210716202900.B431E9111A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=eae43a39d89d66547b20929395192fbf283be40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index db7dfd6b15..bdcb72a695 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  586eb4e4dcb1e41242ede0c5bcfd4014  aiohttp-3.7.4.tar.gz
-sha256  5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de  aiohttp-3.7.4.tar.gz
+md5  7052a8e9877921d73da98d2b18c9a145  aiohttp-3.7.4.post0.tar.gz
+sha256  493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf  aiohttp-3.7.4.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  96627bed0ad08e9b2efa9f4e04e80837cd0550e7694a0fec33b1dab2550282ab  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e878ac1a55..ef0ce8b635 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.7.4
+PYTHON_AIOHTTP_VERSION = 3.7.4.post0
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/7a/95/eb60aaad7943e18c9d091de93c9b0b5ed40aa67c7d5e3c5ee9b36f100a38
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/99/f5/90ede947a3ce2d6de1614799f5fea4e93c19b6520a59dc5d2f64123b032f
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
