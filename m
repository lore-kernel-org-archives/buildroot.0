From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:28 +0200
Subject: [Buildroot] [git commit] rings: add license info
Message-ID: <20120806104901.30CC796D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d1730585bcae184272099c1f25a4d98dc5a51f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rings/rings.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index c196d85..e2a2bd7 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -7,6 +7,7 @@
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
 RINGS_DEPENDENCIES = lua
+RINGS_LICENSE = MIT
 
 define RINGS_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
