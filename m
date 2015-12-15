From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:39 +0100
Subject: [Buildroot] [git commit] vde2: comma separate licenses
Message-ID: <20151215210845.0B99680409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6d12d94af7682b9dc7f1cc4e5c02cade968e0d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vde2/vde2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index f4a8c84..bad758d 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -7,7 +7,7 @@
 VDE2_VERSION = 2.3.2
 VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPLv2+ LGPLv2.1+ BSD-3c
+VDE2_LICENSE = GPLv2+, LGPLv2.1+, BSD-3c
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
