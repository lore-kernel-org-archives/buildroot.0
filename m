From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 19 Dec 2016 09:22:35 +0100
Subject: [Buildroot] [PATCH 2/3] python-zope-interface: bump to version 4.3.3
In-Reply-To: <1482135756-21472-1-git-send-email-yegorslists@googlemail.com>
References: <1482135756-21472-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1482135756-21472-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 8558c9a..7a46cd3 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/zope-interface/json, sha256 locally computed
-md5	5f7e15a5bcdfa3c6c0e93ffe45caf87c  zope.interface-4.3.2.tar.gz
-sha256	6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee  zope.interface-4.3.2.tar.gz
+md5	ba3f32eacaea66094b7e2ae2788cec89  zope.interface-4.3.3.tar.gz
+sha256	8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88  zope.interface-4.3.3.tar.gz
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 7daf5aa..3e3b464 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.3.2
+PYTHON_ZOPE_INTERFACE_VERSION = 4.3.3
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/38/1b/d55c39f2cf442bd9fb2c59760ed058c84b57d25c680819c25f3aff741e1f
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/44/af/cea1e18bc0d3be0e0824762d3236f0e61088eeed75287e7b854d65ec9916
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPLv2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.1.4
