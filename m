From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:19:33 +0200
Subject: [Buildroot] [git commit] package/xtables-addons: bump version to 3.9
Message-ID: <20200716071707.83BD881363@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ec78444eb3c8c117172a501e1a3139cca975334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Separate the fields in the hash file by two spaces and remove hash of
old version.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xtables-addons/xtables-addons.hash | 5 ++---
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index fea496d997..33cc139b36 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256 189ff57a0b8960969bd99141a6c79c345efa67e4461f450e2f162c9bd3d17da6 xtables-addons-3.5.tar.xz
-sha256 045ee3fcfe5d6edb95483cf49e2446ff8cab4bb79411018b18354138b70c5eb5 xtables-addons-3.7.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 LICENSE
+sha256  064dd68937d98e6cfcbdf51ef459310d9810c17ab31b21285bc7a76cdcef7c49  xtables-addons-3.9.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index dab57d980e..c9e5bfdde0 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.7
+XTABLES_ADDONS_VERSION = 3.9
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
