From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:20 +0200
Subject: [Buildroot] [git commit branch/next] libesmtp: handle
	libesmtp-config script
Message-ID: <20130511204539.137079A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52f00e24fedd44969a7681ae1aa68c75dd305310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libesmtp/libesmtp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 078a729..baa0d64 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -7,7 +7,7 @@ LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
 LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
-
+LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
 $(eval $(autotools-package))
