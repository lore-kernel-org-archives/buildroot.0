From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:48:29 +0100
Subject: [Buildroot] [git commit] sshfs: add license information
Message-ID: <20130121225447.E249C9A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca005cdd214546c53d09233750b412896cc64d37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sshfs/sshfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index e72db0a..f3c86cf 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -7,6 +7,8 @@
 SSHFS_VERSION = 2.4
 SSHFS_SITE = http://downloads.sourceforge.net/project/fuse/sshfs-fuse/$(SSHFS_VERSION)
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
+SSHFS_LICENSE = GPLv2
+SSHFS_LICENSE_FILES = COPYING
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
