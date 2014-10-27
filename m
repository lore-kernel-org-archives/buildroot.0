From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:13:19 +0100
Subject: [Buildroot] [git commit] flann: bump version
Message-ID: <20141027002037.2AB72B0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6eda7df7a1e0058e21b7d6b2e63b3dd0e1f577de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flann/flann.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index 98af0b1..8af58e3 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANN_VERSION = d0c04f4d290ebc3aa9411a3322992d298e51f5aa
+FLANN_VERSION = 04b4a56533faf8c8228d011d05ba376038364b49
 FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
