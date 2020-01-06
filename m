From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2020 16:42:43 +0100
Subject: [Buildroot] [git commit] package/ncmpc: bump to version 0.36
Message-ID: <20200106153418.A380D8EE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ccf0795b88f08c7c3e26795e768cfc0fcd92371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 7bde99bfc9..2a8533a2ee 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 bd4f1e638290915e08be045087c1df2d562d012b14f662dd33fd7c7043ddd241  ncmpc-0.35.tar.xz
+sha256 4632873dfc8efe61e501dc9184a5b921b482be2ddbedd3d23d05241d477a3e2c  ncmpc-0.36.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index a8805c334c..86e3c8383f 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).35
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).36
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
