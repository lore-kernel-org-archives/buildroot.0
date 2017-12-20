From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:22:38 +0100
Subject: [Buildroot] [git commit] nasm: bump to version 2.13.02
Message-ID: <20171220202309.5785A8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=388a4bda6b542168f657f45689e5b756e842c416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add a hash for the license file.

Release notes:
http://www.nasm.us/doc/nasmdocc.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nasm/nasm.hash | 3 ++-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index b88671c..260e5d7 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 aa0213008f0433ecbe07bb628506a5c4be8079be20fc3532a5031fd639db9a5e  nasm-2.13.01.tar.xz
+sha256 8ac3235f49a6838ff7a8d7ef7c19a4430d0deecc0c2d3e3e237b5e9f53291757  nasm-2.13.02.tar.xz
+sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 3e2515e..ee3fd9c 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.13.01
+NASM_VERSION = 2.13.02
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
