From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:13:54 +0200
Subject: [Buildroot] [git commit] package/s6: bump to version 2.10.0.2
Message-ID: <20210407185256.A90D381640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f552c710fc1508e66d8f91939be043817c6db3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to year change.

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6/s6.hash | 4 ++--
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 9b355351ea..9cc6f4477d 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 e0cdbaf26e3ba1c41ecc0a8d1f45fb78194f96109b55cabeb849528b7e966c57  s6-2.9.0.1.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 b23afce87080b848b89499e85ebd93c20269e6db23f6ef65e58386c9cecd6c21  s6-2.10.0.2.tar.gz
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index ec1407381e..443ecbbffd 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.9.0.1
+S6_VERSION = 2.10.0.2
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
