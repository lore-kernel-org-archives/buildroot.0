From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:25 +0200
Subject: [Buildroot] [PATCH 4/6] package/evemu: fix legal-info
In-Reply-To: <cover.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <bb6c1928ed5672f25cc486da5fe7217f8ae671a2.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

COPYING.GPL3 is not present in the sources.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/evemu/evemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 9acdbe2..b502469 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -8,7 +8,7 @@ EVEMU_VERSION = 2.1.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
-EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
+EVEMU_LICENSE_FILES = COPYING
 
 # asciidoc used to generate manpages, which we don't need, and if it's
 # present on the build host, it ends getting called with our host-python
-- 
1.9.1
