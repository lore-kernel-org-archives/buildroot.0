From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:15:32 +0200
Subject: [Buildroot] [git commit] package/enet: bump to version 1.3.17
Message-ID: <20210429084946.9320D81038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47aff8e8ef0f34f76082fbe72ff4728067f5b996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://github.com/lsalzman/enet/blob/v1.3.17/ChangeLog

Update file hash due to update license dates:
https://github.com/lsalzman/enet/commit/5b93d08fa5e30fce3e3b1d922de6035dadd9e9af

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enet/enet.hash | 4 ++--
 package/enet/enet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enet/enet.hash b/package/enet/enet.hash
index ed5231c779..2643878ca9 100644
--- a/package/enet/enet.hash
+++ b/package/enet/enet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 98f6f57aab0a424469619ed3047728f0d3901ce8f0dea919c11e7966d807e870  enet-1.3.14.tar.gz
-sha256 eebe647a9ef7e596b0e8b9216c215f169d762af1a27904a87bc2e05b83735d35  LICENSE
+sha256  a38f0f194555d558533b8b15c0c478e946310022d0ec7b34334e19e4574dcedc  enet-1.3.17.tar.gz
+sha256  77f94e3be39938801163844b8bf9a4f12badcc0da136e9886e7da14a816d74d3  LICENSE
diff --git a/package/enet/enet.mk b/package/enet/enet.mk
index b12c1b60af..e2feb26b54 100644
--- a/package/enet/enet.mk
+++ b/package/enet/enet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENET_VERSION = 1.3.14
+ENET_VERSION = 1.3.17
 ENET_SITE = http://enet.bespin.org/download
 ENET_LICENSE = MIT
 ENET_LICENSE_FILES = LICENSE
