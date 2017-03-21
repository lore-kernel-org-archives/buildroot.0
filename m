From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Mar 2017 15:50:15 +0000
Subject: [Buildroot] [PATCH] moarvm: bump version to 2017.03
Message-ID: <20170321155015.54152-1-Vincent.Riera@imgtec.com>
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
index c68f6f9..a27d81b 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 3a486ca5d19a8e6256e379655ec9ed09ff2f1c4f6a57a7969a278819b5bcb4eb  MoarVM-2017.02.tar.gz
+sha256 c562a91d462a15f3a964969ddea8b33eae4558e3b25d9e2105f81c259249dbee  MoarVM-2017.03.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 3f0eaff..f88c6f9 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2017.02
+MOARVM_VERSION = 2017.03
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.10.2
