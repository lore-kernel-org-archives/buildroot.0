From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Dec 2015 11:27:34 -0300
Subject: [Buildroot] [PATCH] python-pyasn: fix license file
Message-ID: <1450189654-24076-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not LICENSE.txt and not LICENSE, fixes:
http://autobuild.buildroot.net/results/d29/d293f35d8034eaaa519565b14641d1b56206cbc8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-pyasn/python-pyasn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 8b10958..80d18cd 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -8,7 +8,7 @@ PYTHON_PYASN_VERSION = 0.1.9
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
 PYTHON_PYASN_LICENSE = BSD-2c
-PYTHON_PYASN_LICENSE_FILES = LICENSE
+PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
2.4.10
