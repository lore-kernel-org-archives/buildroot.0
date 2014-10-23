From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:36 +0200
Subject: [Buildroot] [PATCH 10/11] boot/grub: update patchlevel,
	update snapshot.debian.org date
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-11-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 boot/grub/grub.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.10.4
