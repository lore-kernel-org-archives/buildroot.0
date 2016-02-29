From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:45:15 +0100
Subject: [Buildroot] [git commit branch/next] lvm2: bump to version 2.02.144
Message-ID: <20160229204520.085B87FFE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=045fd769bd0be6057ff67cc6b2f6d50b1e149d0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 17434ff..8390596 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 d827cbd5dde6079f9fedb6bd64025d33a93a00cd1af6d57873be78df07069c5b9921077d6be98a6445829cfea28ba7a5520db0be58d6e7a7824f1a722d739fb6  LVM2.2.02.138.tgz
+sha512 7689a7a26af6ba8fa5a46a96f3bf757c149806f813740b2df004692a63f05cfc522321d67984d34a1c34d55eb1dab5513b2a6bc48c46a7daec873607ea3ada39  LVM2.2.02.144.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 0d0dc2c..74e0e4f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.138
+LVM2_VERSION = 2.02.144
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
