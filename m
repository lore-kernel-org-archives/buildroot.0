From: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
Date: Mon,  9 Sep 2019 12:16:39 +0530
Subject: [Buildroot] [PATCH v3] package/python-sip: bump to version 4.19.13
Message-ID: <20190909064640.16289-1-ymdatta.work@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
---

Changes from Version 2 -> 3:

 Used First name and last name when signing off
 the patch.

 package/python-sip/python-sip.hash | 7 ++++---
 package/python-sip/python-sip.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index 2f7d4309bc..8035fc3f49 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -1,4 +1,5 @@
-# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/
-md5 78724bf2a79878201c3bc81a1d8248ea	sip-4.18.tar.gz
+# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.13/
+md5  9124cb8978742685747a5415179a9890		sip-4.19.13.tar.gz
+sha1 acb826ca1a49742d17686cef246cceabcc87e3b9	sip-4.19.13.tar.gz
 # Locally calculated:
-sha256 f1dc5c81c07a9ad97edcd4a0af964a41e420024ba7ca165afd2b351efd249cb6	sip-4.18.tar.gz
+sha256 e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e  sip-4.19.13.tar.gz
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 69019f5f19..15c025142a 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SIP_VERSION = 4.18
+PYTHON_SIP_VERSION = 4.19.13
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
-- 
2.17.1
