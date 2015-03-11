From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 11 Mar 2015 12:12:04 -0500
Subject: [Buildroot] [PATCH] python-netifaces: change license file name
Message-ID: <1426093924-30591-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Graziano <david.graziano@rockwellcollins.com>

    Change license file name from README to README.rst.

Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/python-netifaces/python-netifaces.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index f748bc1..2c51ce0 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -8,7 +8,7 @@ PYTHON_NETIFACES_VERSION = 0.10.4
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces
 PYTHON_NETIFACES_LICENSE = MIT
-PYTHON_NETIFACES_LICENSE_FILES = README
+PYTHON_NETIFACES_LICENSE_FILES = README.rst
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
1.9.1
