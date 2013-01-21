From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:46 -0300
Subject: [Buildroot] [PATCH 06/10] sshfs: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sshfs/sshfs.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.12.4
