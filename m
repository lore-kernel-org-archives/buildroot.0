From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:25:48 +0200
Subject: [Buildroot] [git commit] nasm: version bump 2.11.02
Message-ID: <20140403192648.964759B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c526b5107e59223c107cdc0ddd2d3943b9b454f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index d8045da..18efa4a 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.10.01
+NASM_VERSION = 2.11.02
 NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 
