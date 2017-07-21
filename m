From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 21 Jul 2017 10:12:27 +0200
Subject: [Buildroot] [PATCH 4/7] python-werkzeug: bump to version 0.12.2
In-Reply-To: <20170721081230.5584-1-yegorslists@googlemail.com>
References: <20170721081230.5584-1-yegorslists@googlemail.com>
Message-ID: <20170721081230.5584-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index a1c44f492..4b2075071 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/werkzeug/json, sha256 locally computed
-md5 cb4010478dd33905f95920e4880204a2 Werkzeug-0.11.15.tar.gz
-sha256 455d7798ac263266dbd38d4841f7534dd35ca9c3da4a8df303f8488f38f3bcc0 Werkzeug-0.11.15.tar.gz
+# md5 from https://pypi.python.org/pypi/Werkzeug/json, sha256 locally computed
+md5	e385b2c5a7193cff24c689b31e1124dc  Werkzeug-0.12.2.tar.gz
+sha256	903a7b87b74635244548b30d30db4c8947fe64c5198f58899ddcd3a13c23bb26  Werkzeug-0.12.2.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index dfa657cb7..6d478f7c1 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.11.15
+PYTHON_WERKZEUG_VERSION = 0.12.2
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/fe/7f/6d70f765ce5484e07576313897793cb49333dd34e462488ee818d17244af
+PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/56/41/c095a77eb2dd69bf278dd664a97d3416af04e9ba1a00b8c138f772741d31
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
-- 
2.11.0
