From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:11:58 -0500
Subject: [Buildroot] [PATCH 01/58] python-autobahn: bump to version 0.17.1
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index cae9160..0bcb2d9 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed
-md5	9850702d0078c5a4aa17170afe2f233c  autobahn-0.16.0.tar.gz
-sha256	a1dcb4315a0914da56ec484659816de72dfad229be4ac19fa61bbc0111ada884  autobahn-0.16.0.tar.gz
+md5 f6b3c2684b873ae29111385b695b28fb autobahn-0.17.1.tar.gz
+sha256 4b8667375161f9a3516b71d7fd47aa31ba100bb822d1a235baaf9185ea252959 autobahn-0.17.1.tar.gz
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index a5e9aee..3009755 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 0.16.0
+PYTHON_AUTOBAHN_VERSION = 0.17.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/68/37/2523309412f0fb93a7784c65e5c5639b4b5d7a84f91374ad6c3c2d5af60b
+PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/28/36/c146415f70f62ae678c4b6dae64872eb7d55661dbb8830a5fa594143478c
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-- 
2.9.3
