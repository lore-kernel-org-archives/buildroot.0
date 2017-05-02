From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:53:03 +0200
Subject: [Buildroot] [git commit] moarvm: bump version to 2017.04
Message-ID: <20170502205315.4EB608262B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=077ee247af0b69a58e35aca656e02711c882692c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index a27d81b..5571c62 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c562a91d462a15f3a964969ddea8b33eae4558e3b25d9e2105f81c259249dbee  MoarVM-2017.03.tar.gz
+sha256 7838c92e50afe75669f751db8e15f06666e32d5951d026a89de28f7c7a8c347f  MoarVM-2017.04.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index f88c6f9..df5defd 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2017.03
+MOARVM_VERSION = 2017.04
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
