From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 22:03:17 +0200
Subject: [Buildroot] [git commit] kmscube: Change repository to gitlab
Message-ID: <20200401200035.2FF518A536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=396191b1562072de11a702ffb9d61e7de9f40c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The https://cgit.freedesktop.org/mesa/kmscube repository
is mirrored from https://gitlab.freedesktop.org/mesa/kmscube, so
switch to the gitlab one.

The other advantage of using the gitlab repository is that it can handle
archive downloads, so switch to it.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmscube/kmscube.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 37983b1a78..73d290c88b 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
-KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
+KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
 KMSCUBE_AUTORECONF = YES
