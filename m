From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:22:21 +0200
Subject: [Buildroot] [git commit] package/vpnc: use github release
Message-ID: <20200617202045.94A1983BA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2964510c93f8a0832a8644098281c469330812ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use github release instead of commit hash so the package will be set as
"up-to-date" in http://autobuild.buildroot.org/stats

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vpnc/vpnc.hash | 2 +-
 package/vpnc/vpnc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
index f512a77792..a1b3b3b200 100644
--- a/package/vpnc/vpnc.hash
+++ b/package/vpnc/vpnc.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  c10a5c2c0813198ca2404dd36db380cdb6395b46338123b341775095cf61521d  vpnc-b1243d29e0c00312ead038b04a2cf5e2fa31d740.tar.gz
+sha256  5929d3b7f72970c8f7850e0daba0d9d05aaaa1281c69f58ac8647be11385ede5  vpnc-0.5.3r550-2jnpr1.tar.gz
 sha256  bf3ec1bd1dec31a6ab8980bfd04569f506432f35ee01e88a3910847784bc2de1  COPYING
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 81cd830ead..8db5e766c1 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VPNC_VERSION = b1243d29e0c00312ead038b04a2cf5e2fa31d740
+VPNC_VERSION = 0.5.3r550-2jnpr1
 VPNC_SITE = $(call github,ndpgroup,vpnc,$(VPNC_VERSION))
 VPNC_LICENSE = GPL-2.0+
 VPNC_LICENSE_FILES = COPYING
