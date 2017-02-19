From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:24 -0500
Subject: [Buildroot] [PATCH 27/58] python-netaddr: bump to version 0.7.19
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-28-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-netaddr/python-netaddr.hash | 6 +++---
 package/python-netaddr/python-netaddr.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index 5fcdda4..59628db 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c65bb34f8bedfbbca0b316c490cd13a0, sha256 locally computed.
-md5	c65bb34f8bedfbbca0b316c490cd13a0  netaddr-0.7.18.tar.gz
-sha256	a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19  netaddr-0.7.18.tar.gz
+# md5 from https://pypi.python.org/pypi/netaddr/json, sha256 locally computed
+md5 51019ef59c93f3979bcb37d3b8527e07 netaddr-0.7.19.tar.gz
+sha256 38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd netaddr-0.7.19.tar.gz
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index c68b24f..69ad3cc 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.7.18
+PYTHON_NETADDR_VERSION = 0.7.19
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = http://pypi.python.org/packages/source/n/netaddr
+PYTHON_NETADDR_SITE = https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0
 PYTHON_NETADDR_LICENSE = BSD-3c
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = distutils
-- 
2.9.3
