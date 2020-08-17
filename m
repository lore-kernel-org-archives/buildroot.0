From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:41:04 +0200
Subject: [Buildroot] [git commit branch/next] package/python-pyzmq: bump to
 version 19.0.2
Message-ID: <20200817130558.C0D3282168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=838c85c512ed0c9e8b77d975ac28e7f4ae1f008c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyzmq/python-pyzmq.hash | 4 ++--
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 2bbaad009a..ecf6489249 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  4650e45ebcf8e08620211c0e720d6066  pyzmq-19.0.0.tar.gz
-sha256  13a5638ab24d628a6ade8f794195e1a1acd573496c3b85af2f1183603b7bf5e0  pyzmq-19.0.1.tar.gz
+md5  200abc1a75bdcfff7adf61304f46f55e  pyzmq-19.0.2.tar.gz
+sha256  296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438  pyzmq-19.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
 sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 84d339f745..d1f4314a1e 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 19.0.1
+PYTHON_PYZMQ_VERSION = 19.0.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/86/08/e5fc492317cc9d65b32d161c6014d733e8ab20b5e78e73eca63f53b17004
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/05/77/7483975d84fe1fd24cc67881ba7810e0e7b3ee6c2a0e002a5d6703cca49b
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
