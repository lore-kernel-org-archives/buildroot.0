From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 22:45:36 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/bitcoin: drop
 boost program-options
Message-ID: <20201113213218.62AC283BDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8af5345bf6e34c7d427b10ae88819933913e82a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

boost program-options is not needed since version 0.17.0 and
https://github.com/bitcoin/bitcoin/commit/f447a0a7079619f0d650084df192781cca9fd826

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2185877a805a2a1c6821b49ac74ee3aadfc68f58)
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
