From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:39:15 +0200
Subject: [Buildroot] [git commit branch/next] moarvm: bump version to 2017.05
Message-ID: <20170525133946.10CFB826B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51e022fd8d6be23e343a8305c787f9566da5dcdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 5571c62..409486a 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7838c92e50afe75669f751db8e15f06666e32d5951d026a89de28f7c7a8c347f  MoarVM-2017.04.tar.gz
+sha256 7cb9b7a871b14ac9b6cddc57e646d277177c4b3b21220e6fbc204084a15a4e41  MoarVM-2017.05.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index df5defd..e03d594 100644
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
