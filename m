From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:53:47 +0200
Subject: [Buildroot] [git commit] package/libev: bump version to 4.24
Message-ID: <20170604075413.8348880770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ef853a698b65212d82b3f169597fb1f3ffa3f75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/libev.hash | 2 +-
 package/libev/libev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index 7f029df..d3b7bb5 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	736079e8ac543c74d59af73f9c52737b3bfec9601f020bf25a87a4f4d0f01bd6	libev-4.22.tar.gz
+sha256 973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821  libev-4.24.tar.gz
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 87cdd6f..5d9020c 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.22
+LIBEV_VERSION = 4.24
 LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
