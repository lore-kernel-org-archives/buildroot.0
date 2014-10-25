From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:26:39 +0200
Subject: [Buildroot] [git commit] boot/grub: update patchlevel,
	update snapshot.debian.org date
Message-ID: <20141025095905.8A095B13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f1eeae24b915debbbc69ba0eba098f31a639fbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 0331e33..535ada6 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -6,8 +6,8 @@
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
-GRUB_PATCH = grub_$(GRUB_VERSION)-67.diff.gz
-GRUB_SITE = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
+GRUB_PATCH = grub_$(GRUB_VERSION)-68.diff.gz
+GRUB_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
