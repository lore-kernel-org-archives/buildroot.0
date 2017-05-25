From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 25 May 2017 11:06:27 +0100
Subject: [Buildroot] [PATCH next] moarvm: bump version to 2017.05
Message-ID: <20170525100627.1429-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 5571c6265..409486ac7 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7838c92e50afe75669f751db8e15f06666e32d5951d026a89de28f7c7a8c347f  MoarVM-2017.04.tar.gz
+sha256 7cb9b7a871b14ac9b6cddc57e646d277177c4b3b21220e6fbc204084a15a4e41  MoarVM-2017.05.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index df5defd0a..e03d59411 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2017.04
+MOARVM_VERSION = 2017.05
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.13.0
