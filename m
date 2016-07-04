From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:26 +0200
Subject: [Buildroot] [PATCH 15/83 v2] package/php: move list of extensions
	after interface selection
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <ab59e94a844278f66998edc238730718a0bebdaf.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
2.7.4
