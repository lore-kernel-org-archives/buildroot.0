From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-click: bump to version 6.7
Message-ID: <20170302205923.09D1082298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a1517c733010e8f648a930153e0e2f0e831c18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
