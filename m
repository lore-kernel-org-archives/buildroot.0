From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:24:42 +0200
Subject: [Buildroot] [git commit branch/next] evemu: bump version to 2.2.0
Message-ID: <20150818122601.E645081DD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a984f5aa094e3c966b1f363108861b28034dd1b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2015-August/001190.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/evemu/evemu.hash |    4 ++--
 package/evemu/evemu.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 99668b7..9d7bb50 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001125.html
-sha256 0c87360882751356e9f977ebf7438c00fe97deb232ac725dd86e5ba78203ee97 evemu-2.1.0.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-August/001190.html
+sha256 e0f79808959d1b1f307a3d5add8ee9e5786d926e9aeb0045dadb85c7350d0a3c evemu-2.2.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index b502469..ad56888 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.1.0
+EVEMU_VERSION = 2.2.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
