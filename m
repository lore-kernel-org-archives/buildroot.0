From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 18:49:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.4.7
Message-ID: <20190315174912.4945-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting https://openvpn.net/community-downloads/
"This is primarily a maintenance release with bugfixes and improvements.
 One of the big things is enhanced TLS 1.3 support."

Release notes:
https://github.com/OpenVPN/openvpn/commit/2b8aec62d5db2c17d5d4052991bc18272748bf29

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index b740ea9a86..a4819f8ad2 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256 4f6434fa541cc9e363434ea71a16a62cf2615fb2f16af5b38f43ab5939998c26  openvpn-2.4.6.tar.xz
+sha256 a42f53570f669eaf10af68e98d65b531015ff9e12be7a62d9269ea684652f648  openvpn-2.4.7.tar.xz
 sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 858398a321..4c6956fe12 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.6
+OPENVPN_VERSION = 2.4.7
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.20.1
