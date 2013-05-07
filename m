From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 23:40:39 +0200
Subject: [Buildroot] [git commit] msmtp: bump to version 1.4.31
Message-ID: <20130507214141.2FC3099CCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea78a5f4de26dc3ab0b5c195e0cf5e47719d3c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/msmtp/msmtp.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 87a2fbb..e99ab3d 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-MSMTP_VERSION = 1.4.27
+MSMTP_VERSION = 1.4.31
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
+MSMTP_LICENSE = GPLv3+
+MSMTP_LICENSE_FILES = COPYING
 
 MSMTP_DEPENDENCIES += host-pkgconf
 
