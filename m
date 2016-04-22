From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Apr 2016 13:40:15 +0200
Subject: [Buildroot] [PATCH] moarvm: bump to version 2016.04
Message-ID: <1461325215-8469-1-git-send-email-francois.perrad@gadz.org>
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
index 4706177..f045f4f 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  d409b684c7c92b144b31cf7f0408f30ccbb033ce646f57d7fbaeb9683773e37b  MoarVM-2016.01.tar.gz
+sha256  6fe9000daada59535747f2557cc73573241ba8a6044271caf1647aa37be33c6d  MoarVM-2016.04.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 7456902..734c027 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2016.01
+MOARVM_VERSION = 2016.04
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.5.0
