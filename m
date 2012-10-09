From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 14:43:46 +0200
Subject: [Buildroot] [git commit] patch: bump to version 2.7.1
Message-ID: <20121009124425.86DC999813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d9dfd817012090bb2753c7a3dee94ff1d2e0027
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/patch/patch.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 346aabd..badc431 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PATCH_VERSION = 2.7
+PATCH_VERSION = 2.7.1
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
 PATCH_LICENSE_FILE = COPYING
