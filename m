From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 7 Dec 2016 15:38:39 -0800
Subject: [Buildroot] [PATCH v2 1/2] package/xen: Bump Xen to 4.7.1
In-Reply-To: <1481153920-20627-1-git-send-email-alistair.francis@xilinx.com>
References: <1481153920-20627-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <1481153920-20627-2-git-send-email-alistair.francis@xilinx.com>
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
index 602e6c7..c3df243 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623 xen-4.7.0.tar.gz
+sha256 e87f4b0575e78657ee23d31470a15ecf1ce8c3a92a771cda46bbcd4d0d671ffe xen-4.7.1.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index e2c797f..7d32e52 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.7.0
+XEN_VERSION = 4.7.1
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
-- 
2.7.4
