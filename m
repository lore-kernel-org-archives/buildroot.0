From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:47:57 +0200
Subject: [Buildroot] [git commit] luajit: add license info
Message-ID: <20120806104900.CF4389704C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b48be06d85726c5aeebb6b23c73b7184bd58fd72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b35cdb4..e4c46d8 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -7,6 +7,8 @@
 LUAJIT_VERSION = 2.0.0-beta10
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
+LUAJIT_LICENSE = MIT
+LUAJIT_LICENSE_FILES = COPYRIGHT
 
 LUAJIT_INSTALL_STAGING = YES
 
