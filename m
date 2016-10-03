From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:26 +0200
Subject: [Buildroot] [PATCH 06/28] package/python-configobj: bump version to
	5.0.6
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-configobj/python-configobj.hash | 7 +++----
 package/python-configobj/python-configobj.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
index e4f5c6c..d43c453 100644
--- a/package/python-configobj/python-configobj.hash
+++ b/package/python-configobj/python-configobj.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi/configobj/4.7.2
-md5	201dbaa732a9049c839f9bb6c27fc7b5	configobj-4.7.2.tar.gz
-# Calculated based on the hash above
-sha256	515ff923462592e8321df8b48c47e3428f8d406ee22b8de77bef969d1af11171	configobj-4.7.2.tar.gz
+# md5 from https://pypi.python.org/pypi/configobj/json, sha256 locally computed
+md5	e472a3a1c2a67bb0ec9b5d54c13a47d6  configobj-5.0.6.tar.gz
+sha256	a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902  configobj-5.0.6.tar.gz
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
index 5211b1d..d9591d5 100644
--- a/package/python-configobj/python-configobj.mk
+++ b/package/python-configobj/python-configobj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONFIGOBJ_VERSION = 4.7.2
+PYTHON_CONFIGOBJ_VERSION = 5.0.6
 PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
-PYTHON_CONFIGOBJ_SITE = http://pypi.python.org/packages/source/c/configobj
+PYTHON_CONFIGOBJ_SITE = https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab
 PYTHON_CONFIGOBJ_LICENSE = BSD-3c
 # License only mentioned in the source
 PYTHON_CONFIGOBJ_SETUP_TYPE = distutils
-- 
2.9.3
