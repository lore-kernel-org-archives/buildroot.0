From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:56:32 +0200
Subject: [Buildroot] [git commit] package/python-pyzmq: bump to version
 19.0.1
Message-ID: <20200617205529.CD9A28447F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dae3aa93dfff5e6c54c52b4ebea7ce15d25047f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyzmq/python-pyzmq.hash | 2 +-
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index ff091c2fe3..2bbaad009a 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
 md5  4650e45ebcf8e08620211c0e720d6066  pyzmq-19.0.0.tar.gz
-sha256  5e1f65e576ab07aed83f444e201d86deb01cd27dcf3f37c727bc8729246a60a8  pyzmq-19.0.0.tar.gz
+sha256  13a5638ab24d628a6ade8f794195e1a1acd573496c3b85af2f1183603b7bf5e0  pyzmq-19.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
 sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index b912d5322b..84d339f745 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 19.0.0
+PYTHON_PYZMQ_VERSION = 19.0.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/16/4c/762c2c3063c4d45baf4a49acea7a4f561f7b78a45cd04b58d63f4c5f6b8d
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/86/08/e5fc492317cc9d65b32d161c6014d733e8ab20b5e78e73eca63f53b17004
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
