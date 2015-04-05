From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 19:04:39 +0200
Subject: [Buildroot] [git commit] package/evemu: fix legal-info
Message-ID: <20150405171514.696D57F8D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c48267877436002127e5dfa59a92043faa15825
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING.GPL3 is not present in the sources.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/evemu/evemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
