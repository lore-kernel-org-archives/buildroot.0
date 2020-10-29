From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:26:21 +0100
Subject: [Buildroot] [git commit] package/unscd: bump version to 0.54
Message-ID: <20201029221616.00F91838FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d1973c0d3de833fa07f2778f7dd85abed0259ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unscd/unscd.hash | 2 +-
 package/unscd/unscd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
index 671149fda2..9ed698fd2a 100644
--- a/package/unscd/unscd.hash
+++ b/package/unscd/unscd.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  9078255b2b9c344d9a0c3333ce23dda9d745f158dde0ea2244a8c56ba93f7a40  nscd-0.53.c
+sha256  90e12c71732474cac4d055bf9d104e599178b4e1ecb6d3b8c556eaa11f8f6447  nscd-0.54.c
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index c79ec44000..94b46460f6 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNSCD_VERSION = 0.53
+UNSCD_VERSION = 0.54
 UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
 UNSCD_SITE = http://busybox.net/~vda/unscd
 UNSCD_LICENSE = GPL-2.0
