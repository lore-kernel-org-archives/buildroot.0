From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:04 -0500
Subject: [Buildroot] [PATCH 07/58] python-click: bump to version 6.7
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-8-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-click/python-click.hash | 6 +++---
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index c0d0568..cae03c7 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=d0b09582123605220ad6977175f3e51d, sha256 locally computed.
-md5	d0b09582123605220ad6977175f3e51d  click-6.6.tar.gz
-sha256	cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9  click-6.6.tar.gz
+# md5 from https://pypi.python.org/pypi/click/json, sha256 locally computed
+md5 fc4cc00c4863833230d3af92af48abd4 click-6.7.tar.gz
+sha256 f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b click-6.7.tar.gz
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 839a467..e869dd5 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 6.6
+PYTHON_CLICK_VERSION = 6.7
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = http://pypi.python.org/packages/source/c/click
+PYTHON_CLICK_SITE = https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897
 PYTHON_CLICK_LICENSE = BSD-3c
 PYTHON_CLICK_LICENSE_FILES = LICENSE
 PYTHON_CLICK_SETUP_TYPE = setuptools
-- 
2.9.3
