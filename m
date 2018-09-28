From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 10:35:29 +0200
Subject: [Buildroot] [git commit] python-attrs: bump to version 18.2.0
Message-ID: <20180928095058.7E30089143@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cabaf8c5d17b3501b82bdb0a3237b01d6ffff033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-attrs/python-attrs.hash | 8 +++++---
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 4434fa1928..23a5efd584 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/attrs/json, sha256 locally computed
-md5	3b7136a570f3ff8a4ff42e7360073f9f  attrs-17.2.0.tar.gz
-sha256	5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11  attrs-17.2.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/attrs/json
+md5	44700294787c8018858777fc150e5d40  attrs-18.2.0.tar.gz
+sha256	10cbf6e27dbce8c30807caf056c8eb50917e0eaafe86347671b57254006c3e69  attrs-18.2.0.tar.gz
+# Locally computer sha256
+sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index c9633711c8..9fbee2d349 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 17.2.0
+PYTHON_ATTRS_VERSION = 18.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://pypi.python.org/packages/be/41/e909cb6d901e9689da947419505cc7fb7d242a08a62ee221fce6a009a523
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
