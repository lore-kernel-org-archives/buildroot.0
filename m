From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 23 Mar 2016 16:59:23 +0100
Subject: [Buildroot] [PATCH 1/3] python-idna: bump to version 2.1
Message-ID: <1458748765-8005-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 10e3e9d..4e4c677 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=bd17a9d15e755375f48a62c13b25b801, sha256 locally computed
-md5     bd17a9d15e755375f48a62c13b25b801  idna-2.0.tar.gz
-sha256  16199aad938b290f5be1057c0e1efc6546229391c23cea61ca940c115f7d3d3b  idna-2.0.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f6473caa9c5e0cc1ad3fd5d04c3c114b, sha256 locally computed
+md5     f6473caa9c5e0cc1ad3fd5d04c3c114b  idna-2.1.tar.gz
+sha256  ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676  idna-2.1.tar.gz
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 7dd1253..3f9f109 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.0
+PYTHON_IDNA_VERSION = 2.1
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
 PYTHON_IDNA_SITE = https://pypi.python.org/packages/source/i/idna
 PYTHON_IDNA_LICENSE =  BSD-3c
-- 
2.7.0
