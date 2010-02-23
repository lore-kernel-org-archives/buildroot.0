From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] kexec: bump version to fix build
	failure
Message-ID: <20100223202933.0214C776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fbcedeab9dc3122658af2034d39fbde820c8a8e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/kexec.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index a0fb2fd..4367885 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,7 +3,7 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.0
+KEXEC_VERSION = 2.0.1
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
 # no install-strip/install-exec
-- 
1.6.3.3
