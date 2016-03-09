From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 22:09:27 +0100
Subject: [Buildroot] [git commit] nasm: bump to version 2.12
Message-ID: <20160309211234.D87247FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f94071d4165e65e177ed4a9afecbbf361809e27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index c693f52..ec64ae0 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c99467c7072211c550d147640d8a1a0aa4d636d4d8cf849f3bf4317d900a1f7f	nasm-2.11.08.tar.xz
+sha256	f34cc1e984ed619b8f9e96cea632e3c6fdea5e039069dbcb63397b7bd004f5a8	nasm-2.12.tar.xz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index c70557f..3331d65 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.11.08
+NASM_VERSION = 2.12
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
