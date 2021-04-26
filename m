From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:37:20 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/openvpn: security
 bump version to 2.5.2
Message-ID: <20210426141046.4012881327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95ae35a114868ae44f2ebc3f3b316d1dcc1c04e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2020-15078:
https://forums.openvpn.net/viewtopic.php?f=20&t=32179

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 258b372c3ef324c50f4a1cacea5f517b816a8926)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d008b3496d..36f90ff111 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  40930489c837c05f6153f38e1ebaec244431ef1a034e4846ff732d71d59ff194  openvpn-2.5.1.tar.xz
+sha256  b12743836901f365efaf82ab2493967e1b21c21eb43ce9a8da1002a17c9c1dc8  openvpn-2.5.2.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e4066a405a..9b3802fd80 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.1
+OPENVPN_VERSION = 2.5.2
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
