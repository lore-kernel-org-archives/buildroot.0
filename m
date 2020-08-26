From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:23:41 +0200
Subject: [Buildroot] [git commit branch/next] package/nasm: bump version to
 2.15.04
Message-ID: <20200826211723.32ADB8472A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=090a748aae1b9495362000ca6bf953ef8bc8154e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nasm/nasm.hash | 4 ++--
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index d824f22b86..7d04add9dc 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e24ade3e928f7253aa8c14aa44726d1edf3f98643f87c9d72ec1df44b26be8f5  nasm-2.14.02.tar.xz
-sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
+sha256  b0891d23aa083546e7845dfaa0a9109a03f1f57ad0740e7acd07f80df57876d8  nasm-2.15.04.tar.xz
+sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 5a46fd0a4b..63ff52a4af 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.14.02
+NASM_VERSION = 2.15.04
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
