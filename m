From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  2 Dec 2019 19:22:15 +0100
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2019.11
Message-ID: <20191202182215.30546-1-francois.perrad@gadz.org>
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
index a6e96c537..d66f56d63 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 253c945ee6b589ede6949b8e77814542befcbc326190e18ef549634db4955988  MoarVM-2019.07.1.tar.gz
+sha256 d882c5114e35800eba2226f2104997052e98b3efdea6463e7edb213a87870201  MoarVM-2019.11.tar.gz
 sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 26ff8662a..ca770493a 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2019.07.1
+MOARVM_VERSION = 2019.11
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.20.1
