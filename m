From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Dec 2012 22:39:40 +0100
Subject: [Buildroot] [PATCH 4/4] package/qemu: bump version
In-Reply-To: <cover.1355434710.git.yann.morin.1998@free.fr>
References: <cover.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <b868ae7c3562ef5dd3b7027f28dc7f0ebba3b440.1355434710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump QEMU to 1.2.1.

Note: 1.3.0 is out now, but ./configure has changed a bit, and there are
new dependencies, so the bump to 1.3.0 is postponed for a litle while...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 91d0eb8..241a392 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QEMU_VERSION = 1.2.0
+QEMU_VERSION = 1.2.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
 QEMU_SITE = http://wiki.qemu.org/download
 QEMU_LICENSE = GPLv2 LGPLv2.1 MIT BSD-3c BSD-2c Others/BSD-1c
-- 
1.7.2.5
