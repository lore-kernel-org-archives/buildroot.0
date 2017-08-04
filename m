From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  4 Aug 2017 07:27:18 +0200
Subject: [Buildroot] [PATCH] python-netifaces: bump to version 0.10.6
Message-ID: <20170804052718.11102-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-netifaces/python-netifaces.hash | 4 ++--
 package/python-netifaces/python-netifaces.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
index 6f3e358b0..335f907d5 100644
--- a/package/python-netifaces/python-netifaces.hash
+++ b/package/python-netifaces/python-netifaces.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/netifaces/json, sha256 locally computed
-md5     5b4d1f1310ed279e6df27ef3a9b71519                                  netifaces-0.10.5.tar.gz
-sha256  59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b  netifaces-0.10.5.tar.gz
+md5	1d424cb5ef52907c5ab913011122a98b  netifaces-0.10.6.tar.gz
+sha256	0c4da523f36d36f1ef92ee183f2512f3ceb9a9d2a45f7d19cda5a42c6689ebe0  netifaces-0.10.6.tar.gz
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 3e01c2480..3258be7a9 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.10.5
+PYTHON_NETIFACES_VERSION = 0.10.6
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d
+PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/72/01/ba076082628901bca750bf53b322a8ff10c1d757dc29196a8e6082711c9d
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README.rst
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
-- 
2.11.0
