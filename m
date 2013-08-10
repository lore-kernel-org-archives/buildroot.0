From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 10:14:48 +0200
Subject: [Buildroot] [git commit] strongswan: needs host-pkgconf
Message-ID: <20130810081708.B052F9AD89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14d9fc4c746aa7f1c78fe85ce58ccebd2047107c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index b75c70d..cac68f8 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -9,6 +9,7 @@ STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
+STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_CONF_OPT +=                                                             \
       --enable-pkcs11=yes                                                          \
       --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
