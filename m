From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:33:10 +0100
Subject: [Buildroot] [git commit] package/znc: bump version to 1.6.2
Message-ID: <20151213134718.3A86D817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f8891224dad399c063e75164837fa388a7009e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 9d2b4a2..a0b27aa 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ba49397364f48d6d32ae5242bc1166f21d972f85dd390d6bbe68a63ecbb6c140	znc-1.6.1.tar.gz
+sha256	eef17727c0c6433fed1affba0ea76ec7fd60198d2f3c234d8529bd5fb26f0593	znc-1.6.2.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 106be2d..0844b0f 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.1
+ZNC_VERSION = 1.6.2
 ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
