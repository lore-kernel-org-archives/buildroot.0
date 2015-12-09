From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:08:02 +0100
Subject: [Buildroot] [git commit] mc: bump to 4.8.15
Message-ID: <20151209220806.A8B6381EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=615e8c6963f1512cdb9d99e0400374a88b0ff7f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 7ae1c3b..810d144 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.14.sha256:
-sha256  6b1f74efbdf394bfab084f4d2ea2e72173de5f12cd42be2533ca2c3b72edb8e6  mc-4.8.14.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.15.sha256:
+sha256  cf4e8f5dfe419830d56ca7e5f2495898e37ebcd05da1e47ff7041446c87fba16  mc-4.8.15.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 2803c90..39de165 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.14
+MC_VERSION = 4.8.15
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPLv3+
