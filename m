From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2020 22:15:42 +0100
Subject: [Buildroot] [git commit] package/bustle: fix license
Message-ID: <20201129210736.AD16A821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3ca4f10864009f3b43695366f6cd2504634d7b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bustle binaries are licensed under GPL-3.0:
https://gitlab.freedesktop.org/bustle/bustle/-/blob/bustle-0.7.5/LICENSE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bustle/bustle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 675ffb0529..1dbad64aef 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -6,7 +6,7 @@
 
 BUSTLE_VERSION = 0.7.5
 BUSTLE_SITE = https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
-BUSTLE_LICENSE = LGPL-2.1+
+BUSTLE_LICENSE = LGPL-2.1+, GPL-3.0 (binaries)
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
