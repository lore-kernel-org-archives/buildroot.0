From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:36:39 +0100
Subject: [Buildroot] [git commit] package/lxc: bump version to 1.1.5
Message-ID: <20160201224705.EBA917F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62e17a5fc367e511d7443dd5166be248f84f81c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: download location changed to
https://linuxcontainers.org/downloads/lxc, as noticed by Santosh
Multhalli.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash | 4 ++--
 package/lxc/lxc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
