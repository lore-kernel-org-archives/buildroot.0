From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:20:40 +0100
Subject: [Buildroot] [git commit branch/next] package/xtables-addons: bump
 to 3.5
Message-ID: <20191115211755.E003D8F00F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=392446dbf146b33d50337124b59b0123e8e17c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 5ecc4197b7..0d30b1ab1e 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1152205156ceb4ea02307a361d7c4888f07eabc6bb844bd82e7ffab8d1ebd627 xtables-addons-3.4.tar.xz
+sha256 189ff57a0b8960969bd99141a6c79c345efa67e4461f450e2f162c9bd3d17da6 xtables-addons-3.5.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 6b7114f5f7..e8b931eaeb 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.4
+XTABLES_ADDONS_VERSION = 3.5
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
