From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:26 +0530
Subject: [Buildroot] [PATCH 4/9] package: use SPDX short identifier for ZPL
	license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-4-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-meld3/python-meld3.mk                   | 2 +-
 package/python-zope-interface/python-zope-interface.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 529425c..675478e 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -7,7 +7,7 @@
 PYTHON_MELD3_VERSION = 1.0.2
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
 PYTHON_MELD3_SITE = https://pypi.python.org/packages/45/a0/317c6422b26c12fe0161e936fc35f36552069ba8e6f7ecbd99bbffe32a5f
-PYTHON_MELD3_LICENSE = ZPLv2.1
+PYTHON_MELD3_LICENSE = ZPL-2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = setuptools
 
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 3e3b464..cef86cf 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -8,7 +8,7 @@ PYTHON_ZOPE_INTERFACE_VERSION = 4.3.3
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
 PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/44/af/cea1e18bc0d3be0e0824762d3236f0e61088eeed75287e7b854d65ec9916
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
-PYTHON_ZOPE_INTERFACE_LICENSE = ZPLv2.1
+PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.7.4
