From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version 18.1.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-11-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyzmq/python-pyzmq.hash | 5 ++---
 package/python-pyzmq/python-pyzmq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 262777bee0..4b77721a72 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,7 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5	1bcdc3a18c99875e01a24735dc168b8d  pyzmq-18.0.2.tar.gz
-sha256	31a11d37ac73107363b47e14c94547dbfc6a550029c3fe0530be443199026fc2  pyzmq-18.0.2.tar.gz
-
+md5    3c8039d007bbbd08a2275f52f5dc9a35  pyzmq-18.1.0.tar.gz
+sha256 93f44739db69234c013a16990e43db1aa0af3cf5a4b8b377d028ff24515fbeb3  pyzmq-18.1.0.tar.gz
 # Locally calculated
 sha256 aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2   COPYING.BSD
 sha256 44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d   COPYING.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index bcc2604008..cba3abdb52 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 18.0.2
+PYTHON_PYZMQ_VERSION = 18.1.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/a8/5e/7e4ed045fc1fb7667de4975fe8b6ab6b358b16bcc59e8349c9bd092931b6
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/7a/d2/1eb3a994374802b352d4911f3317313a5b4ea786bc830cc5e343dad9b06d
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-- 
2.20.1
