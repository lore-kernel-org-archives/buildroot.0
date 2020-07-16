From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 15 Jul 2020 21:04:18 -0300
Subject: [Buildroot] [PATCH] package/xtables-addons: bump version to 3.9
Message-ID: <20200716000418.30107-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Separate the fields in the hash file by two spaces and remove hash of
old version.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/xtables-addons/xtables-addons.hash | 5 ++---
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index fea496d99754..33cc139b3646 100644
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
index dab57d980e14..c9e5bfdde090 100644
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
-- 
2.17.1
