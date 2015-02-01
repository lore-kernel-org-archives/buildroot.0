From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:32:18 +0100
Subject: [Buildroot] [git commit] package/rpm: sort selected packages
Message-ID: <20150201213233.87F308050E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b9860150377f8bd6850fea4c2e85027fb6c9064
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sort selected packages alphabetically in Config.in

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 620eb1a..379b15b 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,12 +7,12 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_SSL
 	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_NEON_SSL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM package management system.
