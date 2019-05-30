From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:36:56 +0200
Subject: [Buildroot] [git commit branch/next] package/terminology: bump to
 version 1.4.1
Message-ID: <20190530223718.57EE78D48C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d2ee5e7afa40052f4ecfd6f01184fa556fe3dc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See https://www.enlightenment.org/news/2019-05-24-terminology-1.4.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 6b96ed72ad..45885ca301 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/p/enlightenment/mailman/message/36626985/
-sha256  ed5904ba5eb11c67790964306ec260b4134e2a443ef5abd5105610d9943b3e60  terminology-1.4.0.tar.xz
+# From https://www.enlightenment.org/news/2019-05-24-terminology-1.4.1
+sha256  d7b8b35fa38cb6a8746435c44f3517c47324d4c8362b35878ec90c9254d9a956  terminology-1.4.1.tar.xz
 sha256  a907d434f4691990ed8f2826ff7546672e9934a26c798351da12ed544dadc628  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 09b4e536a9..633daf5a02 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.4.0
+TERMINOLOGY_VERSION = 1.4.1
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
