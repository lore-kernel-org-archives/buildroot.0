From: Artem Panfilov <apanfilov@spectracom.com>
Date: Wed,  1 Aug 2018 10:41:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 1.105
Message-ID: <20180801074108.8926-1-apanfilov@spectracom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build issue with network-manager package when polkit package is
enabled.

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 5e133b43e2..b4a1a854c5 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5	polkit-0.103.tar.gz
+sha256	8fdc7cc8ba4750fcce1a4db9daa759c12afebc7901237e1c993c38f08985e1df	polkit-0.103.tar.gz
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e283181427..fb4c171c52 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.103
+POLKIT_VERSION = 0.105
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
-- 
2.17.1
