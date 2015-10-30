From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 30 Oct 2015 20:29:12 +0100
Subject: [Buildroot] [PATCH] moarvm: bump to version 2015.10
Message-ID: <1446233352-2728-1-git-send-email-francois.perrad@gadz.org>
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
index 2a87855..977da7e 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  828843eb3da020ee24ff83933b63aebf4aa774b815a3dfa3a758d6334779565e  MoarVM-2015.05.tar.gz
+sha256  2d05fbac7aa431d5a10625958df1f3d47963d79ede2c875f52fec3ea65ea445f  MoarVM-2015.10.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 5889436..a918b91 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2015.05
+MOARVM_VERSION = 2015.10
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.5.0
