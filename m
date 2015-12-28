From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:43:43 +0100
Subject: [Buildroot] [git commit] nasm: bump to version 2.11.08
Message-ID: <20151228164406.66041801BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4809bb5915e74b76dc27c73361fe0195642dd9e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index a92ba3c..c693f52 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	233c574f2c068c0256f9b3653220ceb247c72b671085595259529156c6cfa55d	nasm-2.11.02.tar.xz
+sha256	c99467c7072211c550d147640d8a1a0aa4d636d4d8cf849f3bf4317d900a1f7f	nasm-2.11.08.tar.xz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b87d6ef..c70557f 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.11.02
+NASM_VERSION = 2.11.08
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
