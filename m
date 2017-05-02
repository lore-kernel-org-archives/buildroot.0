From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  2 May 2017 14:14:59 +0200
Subject: [Buildroot] [PATCH] python-netaddr: change setup type to setuptools
Message-ID: <20170502121459.18710-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

The latest netaddr version switched to setuptools.

Fixes:

http://autobuild.buildroot.net/results/e9b/e9b0013abe7e866fd224593f90ec30bdc809151f

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-netaddr/python-netaddr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 95f78f194..a539845d5 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -9,6 +9,6 @@ PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
 PYTHON_NETADDR_SITE = https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
-PYTHON_NETADDR_SETUP_TYPE = distutils
+PYTHON_NETADDR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.11.0
