From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 18 Jan 2018 10:55:48 -0800
Subject: [Buildroot] [PATCH 2/2] package/xen: Bump to latest 4.10.0 release
In-Reply-To: <20180118185548.8994-1-alistair.francis@xilinx.com>
References: <20180118185548.8994-1-alistair.francis@xilinx.com>
Message-ID: <20180118185548.8994-2-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index fcd4e85f45..fa4d25bab2 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ecf88b01f44cd8f4ef208af3f999dceb69bdd2a316d88dd9a9535ea7b49ed356 xen-4.9.1.tar.gz
+sha256 0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d8f33d4b2ca556844 xen-4.10.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index d31185914c..6aa066e4e2 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.9.1
+XEN_VERSION = 4.10.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-- 
2.14.1
