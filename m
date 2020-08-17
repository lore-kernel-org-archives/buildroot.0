From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 17 Aug 2020 15:52:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-netaddr: bump to version
 0.8.0
Message-ID: <1597672337-14533-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/python-netaddr/python-netaddr.hash | 4 ++--
 package/python-netaddr/python-netaddr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index c834721..91b2007 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/netaddr/json
-md5 51019ef59c93f3979bcb37d3b8527e07 netaddr-0.7.19.tar.gz
+md5 34cad578473b66ad77bc3b2a7613ed4a netaddr-0.8.0.tar.gz
 # Locally computed
-sha256 38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd netaddr-0.7.19.tar.gz
+sha256 d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243 netaddr-0.8.0.tar.gz
 sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index a539845..e3ffe4e 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.7.19
+PYTHON_NETADDR_VERSION = 0.8.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0
+PYTHON_NETADDR_SITE = https://pypi.python.org/packages/c3/3b/fe5bda7a3e927d9008c897cf1a0858a9ba9924a6b4750ec1824c9e617587
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = setuptools
-- 
2.7.4
