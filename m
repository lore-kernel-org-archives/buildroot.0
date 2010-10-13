From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Oct 2010 22:10:52 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain-crosstool-ng: fix
	arch for powerpc
Message-ID: <20101013201324.94E498C062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b721e9c11fae9bd3a836da19d679949e0788283
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 34e2ed9..5ce0b86 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -115,6 +115,7 @@ else ifeq ($(BR2_mipsel),y)
 CTNG_ARCH   := mips
 CTNG_ENDIAN := LE
 else ifeq ($(BR2_powerpc),y)
+CTNG_ARCH   := powerpc
 CTNG_BIT    := 32
 else ifeq ($(BR2_x86_64),y)
 CTNG_ARCH   := x86
-- 
1.7.1
