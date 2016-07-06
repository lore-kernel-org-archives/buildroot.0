From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 13:54:40 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix typo
Message-ID: <20160706115454.75233821AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17bccf176ed3ea236f6aae1e8a26661bd95fe798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Ben Boeckel who noticed it.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a135d3d..4101cb0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,7 +148,7 @@ comment "Legacy options removed in 2016.08"
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	help
-	  The systemd option te enable the compatibility libraries has
+	  The systemd option to enable the compatibility libraries has
 	  been removed. Theses libraries have been useless since a few
 	  version, and have been fully dropped from the source since
 	  v230.
