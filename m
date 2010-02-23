From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:52 +0100
Subject: [Buildroot] [PATCH 28/40] kexec: bump version to fix build failure
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fbcedeab9dc3122658af2034d39fbde820c8a8e9.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
