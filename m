From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:48:35 +0200
Subject: [Buildroot] [git commit] xavante: add license info
Message-ID: <20120806104901.4EDC596D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7c048c624371707da278cf47546e8ca31875f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xavante/xavante.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index f885fbd..0c1c6f1 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -7,6 +7,7 @@
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
 XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
+XAVANTE_LICENSE = MIT
 
 define XAVANTE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr \
