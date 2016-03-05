From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:50:42 +0100
Subject: [Buildroot] [git commit] package/znc: bump version to 1.6.3
Message-ID: <20160305135200.CB7B67FF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f45452d25b05f7cd5379c0684a1d953e334b378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/znc/znc.hash | 4 ++--
 package/znc/znc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index a0b27aa..f243d4a 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	eef17727c0c6433fed1affba0ea76ec7fd60198d2f3c234d8529bd5fb26f0593	znc-1.6.2.tar.gz
+# Locally calculated
+sha256	631c46de76fe601a41ef7676bc974958e9a302b72b25fc92b4a603a25d89b827	znc-1.6.3.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 0844b0f..31e1bcf 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.2
+ZNC_VERSION = 1.6.3
 ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
