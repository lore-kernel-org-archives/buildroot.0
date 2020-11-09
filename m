From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 17:05:45 +0100
Subject: [Buildroot] [git commit] package/bitcoin: drop boost program-options
Message-ID: <20201109155530.EF2CF8138E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2185877a805a2a1c6821b49ac74ee3aadfc68f58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boost program-options is not needed since version 0.17.0 and
https://github.com/bitcoin/bitcoin/commit/f447a0a7079619f0d650084df192781cca9fd826

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
