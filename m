From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 14:13:40 +0100
Subject: [Buildroot] [git commit] moarvm: bump to version 2017.01
Message-ID: <20170130131409.AECF17FC6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66fbae4c9c25aa8f23e243302321d900b0ce71d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 2e49811..e6335ab 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5eaa8ff47b1c25e023a900947f88222fffe0884ce74652659ecd2265ae2d1387  MoarVM-2016.11.tar.gz
+sha256 2074693a42a7f31218bf69b70fd5b73d6fd1a1d0e31eaf3f528e204963e94c53  MoarVM-2017.01.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index d091174..b459474 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2016.11
+MOARVM_VERSION = 2017.01
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
