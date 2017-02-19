From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:00 -0500
Subject: [Buildroot] [PATCH 03/58] python-beautifulsoup4: bump to version
	4.5.3
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-4-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index c86879f..dd0c3e4 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/beautifulsoup4/json, sha256 locally computed
-md5	994abd90e691beaf7d42c00ffb2f3a67  beautifulsoup4-4.5.1.tar.gz
-sha256	3c9474036afda9136aac6463def733f81017bf9ef3510d25634f335b0c87f5e1  beautifulsoup4-4.5.1.tar.gz
+md5 937e0df0d699a1237646f38fd567f0c6 beautifulsoup4-4.5.3.tar.gz
+sha256 b21ca09366fa596043578fd4188b052b46634d22059e68dd0077d9ee77e08a3e beautifulsoup4-4.5.3.tar.gz
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index e2fa9b3..ccec30f 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.5.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.5.3
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/86/ea/8e9fbce5c8405b9614f1fd304f7109d9169a3516a493ce4f7f77c39435b7
+PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/9b/a5/c6fa2d08e6c671103f9508816588e0fb9cec40444e8e72993f3d4c325936
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
-- 
2.9.3
