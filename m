From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:18 +0530
Subject: [Buildroot] [PATCH 07/10] python-shutilwhich: add version to
	license string
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-7-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to Python license version 2. Use SPDX short
identifier for license string while at it.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-shutilwhich/python-shutilwhich.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
index 0497e1b..31a7ea9 100644
--- a/package/python-shutilwhich/python-shutilwhich.mk
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -7,7 +7,7 @@
 PYTHON_SHUTILWHICH_VERSION = 1.1.0
 PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
 PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
-PYTHON_SHUTILWHICH_LICENSE = Python Software Foundation License
+PYTHON_SHUTILWHICH_LICENSE = Python-2.0
 PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.7.4
