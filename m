From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:40:43 +0200
Subject: [Buildroot] [git commit] libesmtp: add license information
Message-ID: <20140625211213.BD7DD9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8940b8ee8dac92e51964568198e34952107daa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libesmtp/libesmtp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index f3f5611..cad2e27 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,5 +10,7 @@ LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+LIBESMTP_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
+LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
