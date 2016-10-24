From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 22:42:07 +0200
Subject: [Buildroot] [git commit] legacy: add missing select
Message-ID: <20161024204215.133FE80E58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c087cbe5c09f70657ca7f2b2061c37afdf109ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When adding a boolean option to legacy, it should slect BR2_LEGACY, to
trigger the legacy warning.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 50ccedd..8c41b05 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -149,6 +149,7 @@ config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "PHP CGI and CLI options are now seperate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
 	select BR2_PACKAGE_PHP_SAPI_CGI
+	select BR2_LEGACY
 	help
 	  The PHP Interface options have been split up into a
 	  separate option for each interface.
@@ -157,6 +158,7 @@ config BR2_PACKAGE_PHP_SAPI_CLI_FPM
 	bool "PHP CLI and FPM options are now separate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
 	select BR2_PACKAGE_PHP_SAPI_FPM
+	select BR2_LEGACY
 	help
 	  The PHP Interface options have been split up into a
 	  separate option for each interface.
