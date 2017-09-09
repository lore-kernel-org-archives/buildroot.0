From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:41 +0200
Subject: [Buildroot] [git commit] skalibs: bump version to 2.6.0.0
Message-ID: <20170909195854.33A6B800CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dceca89464e5105a8ac120edc6dee1fe9c882348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skalibs/skalibs.hash | 2 +-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 8ab7234..16af3af 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 aa387f11a01751b37fd32603fdf9328a979f74f97f0172def1b0ad73b7e8d51d  skalibs-2.5.1.1.tar.gz
+sha256 3572cb8c7d2ae9d16da5a0f3d23b48e013e0c957f1329d100f04dd5accb054c3  skalibs-2.6.0.0.tar.gz
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index b8526dd..5be28d5 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.5.1.1
+SKALIBS_VERSION = 2.6.0.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
