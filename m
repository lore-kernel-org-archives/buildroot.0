From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 08:58:26 +0100
Subject: [Buildroot] [git commit] s6: bump version to 2.6.2.0
Message-ID: <20171215075847.14C73832C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=823197093eef21672505af7538f878b5e328fcb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 2f498b0..d2d42f4 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 0172b7293d4d5607ca3ca77382fee9b87c10bd58680720b29625cf35afc75c5c  s6-2.6.1.1.tar.gz
+sha256 0313e4b55c11a3e12d2e9766971c9cc1eb0aef85ddbb5a4385923839e937acb0  s6-2.6.2.0.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 3cf3885..5ea68a7 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.1.1
+S6_VERSION = 2.6.2.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
