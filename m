From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 2 Feb 2021 20:42:57 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: remove redundant empty
 line
Message-ID: <20210202192419.79FEA864E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b12ce36b17a2ef7dfc618b2c155da32d0aad4a54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1003192260

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 18f9bc5478..6d46132960 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,7 +152,6 @@ config BR2_BINUTILS_VERSION_2_33_X
 	help
 	  binutils 2.33.x has been removed, use a newer version.
 
-
 config BR2_PACKAGE_LIBUPNP18
 	bool "libupnp18 package removed"
 	select BR2_LEGACY
