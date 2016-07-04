From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:11:15 +0200
Subject: [Buildroot] [git commit] package/php: move list of extensions after
	interface selection
Message-ID: <20160704211122.4C6DB81DA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7fe584f2f4a83ba5870d6190fa87a770a1962b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index 32faa32..eee8d26 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -9,8 +9,6 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
-source "package/php/Config.ext"
-
 config BR2_PACKAGE_PHP_CLI
 	bool
 
@@ -66,4 +64,6 @@ config BR2_PACKAGE_PHP_SAPI_CLI_FPM
 
 endchoice
 
+source "package/php/Config.ext"
+
 endif
