From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:13 +0200
Subject: [Buildroot] [git commit] copas: add license info
Message-ID: <20120806104900.EC56B96D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=911b2452037844ed840dc84e874903d976214ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/copas/copas.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index cd9ab7a..c84a6cc 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -7,6 +7,7 @@
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
 COPAS_DEPENDENCIES = lua coxpcall luasocket
+COPAS_LICENSE = MIT
 
 define COPAS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
