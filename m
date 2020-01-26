From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2020 22:03:54 +0100
Subject: [Buildroot] [git commit] package/xtables-addons: bump version to 3.7
Message-ID: <20200126205801.688BB83C0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=447a72a68208cf70941d8a621dbb53d3297f2a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resolves build failure with Linux 5.4

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.hash | 1 +
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 0d30b1ab1e..fea496d997 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 189ff57a0b8960969bd99141a6c79c345efa67e4461f450e2f162c9bd3d17da6 xtables-addons-3.5.tar.xz
+sha256 045ee3fcfe5d6edb95483cf49e2446ff8cab4bb79411018b18354138b70c5eb5 xtables-addons-3.7.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index e8b931eaeb..1a74b80f46 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.5
+XTABLES_ADDONS_VERSION = 3.7
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
