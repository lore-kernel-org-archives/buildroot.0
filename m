From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:13 +0530
Subject: [Buildroot] [PATCH 02/10] python-iniparse: use SPDX identifier for
	python license
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-2-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-iniparse/python-iniparse.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index b00e0c4..5c4e03c 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -7,7 +7,7 @@
 PYTHON_INIPARSE_VERSION = 0.4
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
 PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
-PYTHON_INIPARSE_LICENSE = Python software foundation license v2, MIT
+PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = distutils
 
-- 
2.7.4
