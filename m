From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:21:58 +0200
Subject: [Buildroot] [git commit] genromfs: add license information
Message-ID: <20140701224921.8DF729D134@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5b2670087c34c3d5f9dc13a7d44a0a8211a41f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genromfs/genromfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index c45d1e1..2d50a52 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -6,6 +6,8 @@
 
 GENROMFS_VERSION = 0.5.2
 GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
+GENROMFS_LICENSE = GPLv2+
+GENROMFS_LICENSE_FILES = COPYING
 
 define GENROMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
