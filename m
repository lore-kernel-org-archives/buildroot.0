From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:35:41 +0100
Subject: [Buildroot] [git commit] psplash: bump version
Message-ID: <20150304223607.AD3C57FDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32317a6bef4d7f506acda38eeedb72864eb3a4fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version fixes an image rendering bug and adds configuration items.

Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psplash/psplash.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index b756266..5901547 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = afd4e228c606a9998feae44a3fed4474803240b7
+PSPLASH_VERSION = 14c8f7b705de944beb4de3f296506d80871e410f
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPLv2+
 PSPLASH_AUTORECONF = YES
