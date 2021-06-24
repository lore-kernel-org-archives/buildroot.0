From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:27:29 +0200
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.5.3
Message-ID: <20210624065712.F2AD68D203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9f13a76eec48ac67af33d8d3ef6d068ff40e7ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release note:
https://forums.openvpn.net/viewtopic.php?f=20&t=32497

CVE-2021-3606 fixed by this release is only relevant for Windows.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 36f90ff111..1d365eeab4 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  b12743836901f365efaf82ab2493967e1b21c21eb43ce9a8da1002a17c9c1dc8  openvpn-2.5.2.tar.xz
+sha256  fb6a9943c603a1951ca13e9267653f8dd650c02f84bccd2b9d20f06a4c9c9a7e  openvpn-2.5.3.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9b3802fd80..c07f8b4ff5 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.2
+OPENVPN_VERSION = 2.5.3
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
