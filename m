From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2020 00:25:48 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.1.0
Message-ID: <20201015062548.1397867-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-frozenlist/python-frozenlist.hash | 6 +++---
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 4a006586d2..0ecc5f9cdf 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5	7d493070a7fe12b6be753585c1995abe  frozenlist-1.0.0.tar.gz
-sha256	d1076a40cd1bef6edf148cc05aecce52a11c9bbd2a3d60ce37cc07e03c8dc6c7  frozenlist-1.0.0.tar.gz
+md5  2a83a520014203d0a56993c332ff7e23  frozenlist-1.1.0.tar.gz
+sha256  d167a5050628323fcb3db410375eb06390ab135454fd85fd79c5832f5ec2b8ed  frozenlist-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 1d36b4df51..b113c38080 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.0.0
+PYTHON_FROZENLIST_VERSION = 1.1.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/85/32/12f1247bf4915b74a00264aa0033745ee871759daee47499641bd13aeee7
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/12/0e/119f1f186e93c21d078db1ddd7b21247a8a49261689d9284dec28be3b08e
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
