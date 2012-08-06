From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:17 +0200
Subject: [Buildroot] [git commit] coxpcall: add license info
Message-ID: <20120806104901.06B6196D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c31511cd98e7935882cfdb790c0297b516299e61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coxpcall/coxpcall.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 94fc16c..e7fb76d 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -7,6 +7,7 @@
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
 COXPCALL_DEPENDENCIES = lua
+COXPCALL_LICENSE = MIT
 
 define COXPCALL_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
