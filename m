From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:29:31 +0200
Subject: [Buildroot] [git commit] s6: bump version to 2.7.1.1
Message-ID: <20180501192947.9D1B680811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659246263b2a08a43df3b0017e9022c87a9f5d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 4a20e0f914..12791a9760 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 6617cbf82c73273c67c6102a1a5c48449ef65ffbe8d0db6a587b7f0078dc6e13  s6-2.7.0.0.tar.gz
+sha256 f37547f2890eb50bcb4cd46ffa38bad5ec9e6fd6bc7b73a8df0bdf0cf11f01a9  s6-2.7.1.1.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 5556bfff93..83945b08d5 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.7.0.0
+S6_VERSION = 2.7.1.1
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
