From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Nov 2017 12:05:02 +0100
Subject: [Buildroot] [PATCH 4/4] python-pyxb: bump version to 1.2.6
In-Reply-To: <20171102110502.18102-1-yegorslists@googlemail.com>
References: <20171102110502.18102-1-yegorslists@googlemail.com>
Message-ID: <20171102110502.18102-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyxb/python-pyxb.hash | 7 ++++---
 package/python-pyxb/python-pyxb.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
index 9aa50fc76e..0cfce57618 100644
--- a/package/python-pyxb/python-pyxb.hash
+++ b/package/python-pyxb/python-pyxb.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi/pyxb/json, sha256 locally computed
-md5	197c462ab8427ea197313ca3776b252a  PyXB-1.2.5.tar.gz
-sha256	4e8f62ee2cfffc37e4f40634ab9c79e0311cfaf28cf4ce5e7f4828ec56e4ff67  PyXB-1.2.5.tar.gz
+# md5 from https://pypi.python.org/pypi/PyXB/json, sha256 locally computed
+md5	4303573fc7094ce4664c5b71cd4bdb48  PyXB-1.2.6.tar.gz
+sha256	2a00f38dd1d87b88f92d79bc5a09718d730419b88e814545f472bbd5a3bf27b4  PyXB-1.2.6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
index d0b2da5461..6af10b51e7 100644
--- a/package/python-pyxb/python-pyxb.mk
+++ b/package/python-pyxb/python-pyxb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYXB_VERSION = 1.2.5
+PYTHON_PYXB_VERSION = 1.2.6
 PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
-PYTHON_PYXB_SITE = https://pypi.python.org/packages/43/7a/9d40392e4380463f37bf5aa2851dfd8ba7c0e4d2a9dc2355177b8b785794
+PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
 PYTHON_PYXB_LICENSE = Apache-2.0
 PYTHON_PYXB_LICENSE_FILES = LICENSE
 PYTHON_PYXB_SETUP_TYPE = distutils
-- 
2.11.0
