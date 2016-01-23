From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 15:37:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/lxc: bump version to 1.1.5
Message-ID: <1453559872-11381-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lxc/lxc.hash | 4 ++--
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index d5b8ec5..7470101 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256 8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc lxc-1.1.4.tar.gz
+# Locally calculated
+sha256	9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be	lxc-1.1.5.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b11464e..df25180 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.1.4
+LXC_VERSION = 1.1.5
 LXC_SITE = https://linuxcontainers.org/downloads
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
-- 
2.7.0.rc3
