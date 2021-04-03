From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:41:18 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/openvpn: bump
 version to 2.5.1
Message-ID: <20210403072612.610577FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce9b5a084f6ab93fd0809b91e7ad059aadc1f948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/37226597/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 002fa467bfbcc65497a500afcf2d29d388622e33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 4e371fc87b..d008b3496d 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  029a426e44d656cb4e1189319c95fe6fc9864247724f5599d99df9c4c3478fbd  openvpn-2.5.0.tar.xz
+sha256  40930489c837c05f6153f38e1ebaec244431ef1a034e4846ff732d71d59ff194  openvpn-2.5.1.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7c67e95074..e4066a405a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.0
+OPENVPN_VERSION = 2.5.1
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
