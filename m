From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:37:09 +0100
Subject: [Buildroot] [git commit] s6: bump version to 2.7.0.0
Message-ID: <20180107203751.991CF83B18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bf5af3a1c2164ebdacc4dcf868af63a6599050c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6/s6.hash | 3 ++-
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index d2d42f4..4a20e0f 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 0313e4b55c11a3e12d2e9766971c9cc1eb0aef85ddbb5a4385923839e937acb0  s6-2.6.2.0.tar.gz
+sha256 6617cbf82c73273c67c6102a1a5c48449ef65ffbe8d0db6a587b7f0078dc6e13  s6-2.7.0.0.tar.gz
+sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 5ea68a7..5556bff 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.2.0
+S6_VERSION = 2.7.0.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
