From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:06:34 -0400
Subject: [Buildroot] [PATCH 05/05] package/python-twisted: bump to version
 19.2.1
In-Reply-To: <20190804010634.85332-1-aduskett@gmail.com>
References: <20190804010634.85332-1-aduskett@gmail.com>
Message-ID: <20190804010634.85332-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also change hash for the license file due to a year change.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 884dce1308..ac2c90b42d 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5 20fe2ec156e6e45b0b0d2ff06d9e828f Twisted-18.9.0.tar.bz2
-sha256 294be2c6bf84ae776df2fc98e7af7d6537e1c5e60a46d33c3ce2a197677da395 Twisted-18.9.0.tar.bz2
+md5 528b7856938edc2a752c244aebd94981 Twisted-19.2.1.tar.bz2
+sha256 fa2c04c2d68a9be7fc3975ba4947f653a57a656776f24be58ff0fe4b9aaf3e52 Twisted-19.2.1.tar.bz2
 # Locally computed sha256
-sha256 17305fcdb49a4048310be5b43e9f3cfa9525c508a5117089d8b2ee91800c327b LICENSE
+sha256 61f0a3ad5048489bd985aa4b4e4a2e254a71461b3ad4a6e7a71a7f067a095010 LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index a62637f0d4..90fa35fdcc 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 18.9.0
+PYTHON_TWISTED_VERSION = 19.2.1
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/5d/0e/a72d85a55761c2c3ff1cb968143a2fd5f360220779ed90e0fadf4106d4f2
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/79/59/035de19362320e632301ed7bbde23e4c8cd6fc5e2f1cf8d354cdba857854
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.21.0
