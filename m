From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:53 -0500
Subject: [Buildroot] [PATCH 56/58] python-whoosh: bump to version 2.7.4
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-57-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-whoosh/python-whoosh.hash | 6 +++---
 package/python-whoosh/python-whoosh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-whoosh/python-whoosh.hash b/package/python-whoosh/python-whoosh.hash
index b14dd0f..0621a2a 100644
--- a/package/python-whoosh/python-whoosh.hash
+++ b/package/python-whoosh/python-whoosh.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/Whoosh/json, sha256 locally computed
-md5	9a0fc2df9335e1d2e81dd84a2c4c416f  Whoosh-2.7.0.tar.gz
-sha256	cdfc0e1c5173207ac7b312afe78d83fb552cfed30427bf7b3dba8b1d26cea8f7  Whoosh-2.7.0.tar.gz
+# md5 from https://pypi.python.org/pypi/whoosh/json, sha256 locally computed
+md5 c2710105f20b3e29936bd2357383c325 Whoosh-2.7.4.tar.gz
+sha256 7ca5633dbfa9e0e0fa400d3151a8a0c4bec53bd2ecedc0a67705b17565c31a83 Whoosh-2.7.4.tar.gz
diff --git a/package/python-whoosh/python-whoosh.mk b/package/python-whoosh/python-whoosh.mk
index 64f3820..2baf657 100644
--- a/package/python-whoosh/python-whoosh.mk
+++ b/package/python-whoosh/python-whoosh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHOOSH_VERSION = 2.7.0
+PYTHON_WHOOSH_VERSION = 2.7.4
 PYTHON_WHOOSH_SOURCE = Whoosh-$(PYTHON_WHOOSH_VERSION).tar.gz
-PYTHON_WHOOSH_SITE = http://pypi.python.org/packages/source/W/Whoosh
+PYTHON_WHOOSH_SITE = https://pypi.python.org/packages/25/2b/6beed2107b148edc1321da0d489afc4617b9ed317ef7b72d4993cad9b684
 PYTHON_WHOOSH_SETUP_TYPE = setuptools
 PYTHON_WHOOSH_LICENSE = BSD-3c
 PYTHON_WHOOSH_LICENSE_FILES = LICENSE.txt
-- 
2.9.3
