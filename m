From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:19 +0530
Subject: [Buildroot] [PATCH 08/10] python-ipaddress: add version to license
	string
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-8-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to Python license version 2. Use SPDX short
identifier for license string while at it.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-ipaddress/python-ipaddress.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
index 10ab77a..646db5d 100644
--- a/package/python-ipaddress/python-ipaddress.mk
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -7,7 +7,7 @@
 PYTHON_IPADDRESS_VERSION = 1.0.18
 PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
 PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/4e/13/774faf38b445d0b3a844b65747175b2e0500164b7c28d78e34987a5bfe06
-PYTHON_IPADDRESS_LICENSE = Python software foundation license
+PYTHON_IPADDRESS_LICENSE = Python-2.0
 PYTHON_IPADDRESS_LICENSE_FILES = LICENSE
 PYTHON_IPADDRESS_SETUP_TYPE = setuptools
 
-- 
2.7.4
