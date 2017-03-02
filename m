From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-httplib2: bump to version 0.10.3
Message-ID: <20170302205923.6162082298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f13b35b5f094fa0801b6bb884b9ed7375221075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-httplib2/python-httplib2.hash | 6 +++---
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 879f18b..9a075b6 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=bd1b1445b3b2dfa7276b09b1a07b7f0e, sha256 locally computed
-md5	bd1b1445b3b2dfa7276b09b1a07b7f0e  httplib2-0.9.2.tar.gz
-sha256	c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988  httplib2-0.9.2.tar.gz
+# md5 from https://pypi.python.org/pypi/httplib2/json, sha256 locally computed
+md5 709c305e1b00e9c0af49ee816429569c httplib2-0.10.3.tar.gz
+sha256 e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb httplib2-0.10.3.tar.gz
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index adeddd3..7c14e24 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.9.2
+PYTHON_HTTPLIB2_VERSION = 0.10.3
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = http://pypi.python.org/packages/source/h/httplib2
+PYTHON_HTTPLIB2_SITE = https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
