From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  1 Feb 2021 07:28:27 +0100
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2020.12
Message-ID: <20210201062827.1624244-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 36f0a81f3..abe96c3d4 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  637883083f16c4398ffd3685ea6411daa605dd0862e1f59cce632bb2b994f2c4  MoarVM-2020.10.tar.gz
+sha256  08914f1c464151ebc678cf0d360c9e479a036178fa7c9ddfd34aa4d556d03ea2  MoarVM-2020.12.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 9fe5f4c07..1f4140441 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.10
+MOARVM_VERSION = 2020.12
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.27.0
