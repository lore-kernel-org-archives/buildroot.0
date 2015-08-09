From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:42:44 +0200
Subject: [Buildroot] [git commit branch/next] openvpn: bump to version 2.3.8
Message-ID: <20150809094323.849EC8042C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85e7763e3127a633768322e111bf40d53c4cc188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.hash |    2 +-
 package/openvpn/openvpn.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 9a917b9..49227ea 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4062ce972500f98988e9c6e9dd1040be25582f0d49aa7e69f3f4cff96e9aebee 	openvpn-2.3.7.tar.xz
+sha256	a8620cc6b79beea91de8487f8fd2400a2e1ffdef109917021435cb31417cbb99 	openvpn-2.3.8.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 336d491..1caa9a0 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.7
+OPENVPN_VERSION = 2.3.8
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
