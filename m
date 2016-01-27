From: santosh.multhalli <santosh.multhalli@rockwellcollins.com>
Date: Wed, 27 Jan 2016 16:59:11 +0530
Subject: [Buildroot] [PATCH] updated the package lxc to latest version 1.1.5
Message-ID: <1453894151-30929-1-git-send-email-santosh.multhalli@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index d5b8ec5..31186eb 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc lxc-1.1.4.tar.gz
+sha256  9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be lxc-1.1.5.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b11464e..e382f4d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.1.4
-LXC_SITE = https://linuxcontainers.org/downloads
+LXC_VERSION = 1.1.5
+LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
--
libgit2 0.21.4
