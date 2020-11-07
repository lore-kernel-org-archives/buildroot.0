From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Nov 2020 18:05:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: drop boost program-options
Message-ID: <20201107170559.722445-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost program-options is not needed since version 0.17.0 and
https://github.com/bitcoin/bitcoin/commit/f447a0a7079619f0d650084df192781cca9fd826

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bitcoin/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 1f08f9f26f..89ee2e3938 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_BITCOIN
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
 	help
-- 
2.28.0
