From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:40:54 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/openvpn: security
	bump to 2.4.2
Message-ID: <20170515125327.51C5D828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab268515e081d7f0f90d8cb270b13aa7eab71ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-7478 & CVE-2017-7479:
https://community.openvpn.net/openvpn/wiki/QuarkslabAndCryptographyEngineerAudits

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a4e5ee245e9d19a8e1c95b26bd17f2b6d95e9263)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index a03345e..fe054e9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fde9e22c6df7a335d2d58c6a4d5967be76df173c766a5c51ece57fd044c76ee5  openvpn-2.4.1.tar.xz
+sha256 df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9  openvpn-2.4.2.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 6581a4e..34b0e4b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.1
+OPENVPN_VERSION = 2.4.2
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
