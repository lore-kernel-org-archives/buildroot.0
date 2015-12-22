From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 21:34:18 +0100
Subject: [Buildroot] [git commit] autofs: add missing dependencies on flex
	and bison
Message-ID: <20151222203448.0C1C0826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2badd96d9e933afc052f78c1a91cdc5dd98e1a1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/999/999d2d5fe07994642ab39b26d936c230d79947a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autofs/autofs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index f7ff5f3..0ab8986 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -9,6 +9,7 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPLv2+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
+AUTOFS_DEPENDENCIES = host-flex host-bison
 
 AUTOFS_CONF_OPTS = \
 	--disable-mount-locking \
