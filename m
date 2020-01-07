From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  7 Jan 2020 20:25:18 +0100
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2020.01
Message-ID: <20200107192518.7854-1-francois.perrad@gadz.org>
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
index d66f56d63..5e11a2003 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d882c5114e35800eba2226f2104997052e98b3efdea6463e7edb213a87870201  MoarVM-2019.11.tar.gz
+sha256 9c8d8c01d64d404b35527d0ac773934a73201b84390cd02b14a9d9c5b12cde14  MoarVM-2020.01.tar.gz
 sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index ca770493a..685128aae 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2019.11
+MOARVM_VERSION = 2020.01
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.20.1
