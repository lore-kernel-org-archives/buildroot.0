Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3342CC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39DC70010;
	Tue, 21 Feb 2023 01:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39DC70010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVKdwR_BWCIq; Tue, 21 Feb 2023 01:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07CD6FBCE;
	Tue, 21 Feb 2023 01:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E07CD6FBCE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 828C41BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 247B06FC13
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 247B06FC13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV4KxE1dO3yA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A3006FC0C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A3006FC0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24CAF81979; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:22:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 67ceef8affcb0300efcabab886e9819f56351fd6
X-Git-Newrev: 4092d2a3546c1edfcb27f9d00fd4e7cac9878d2f
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.24CAF81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] *: fix typo for separate(d|)
 in text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4092d2a3546c1edfcb27f9d00fd4e7cac9878d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

seperate is a common misspelling of separate

Fix all the typos in the tree that are not related to patch files.

CHANGES
  seperate -> separate, in the list of changes
Config.in.legacy
  seperate -> separate, in option name and help texts
package/leafnode2/leafnode2.mk
  seperate -> separate, in a comment
system/Config.in
  seperated -> separated, in a help text

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                        | 4 ++--
 Config.in.legacy               | 6 +++---
 package/leafnode2/leafnode2.mk | 2 +-
 system/Config.in               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index dbf62e5a63..9fd8b31350 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7737,7 +7737,7 @@
 
 	Architecture: Default to bf532 CPU variant for blackfin,
 	Fix flat one memory region support for m68k and disable flat
-	seperate data support because of compatibility issues.
+	separate data support because of compatibility issues.
 
 	Defconfigs: Minnowboard and Raspberrypi: Fix errors with
 	post-build scripts when systemd is used.
@@ -8273,7 +8273,7 @@
 
 	Minor fixes.
 
-	Merged/seperate /usr handling is now also performed for
+	Merged/separate /usr handling is now also performed for
 	staging so cross-gdb / gdbserver can find the libraries.
 
 	Updated/fixed packages: autossh, conntrack-tools, dcron,
diff --git a/Config.in.legacy b/Config.in.legacy
index 1c5af2652a..e95460f82b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3346,7 +3346,7 @@ config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	select BR2_PACKAGE_RESTORECOND
 	help
 	  The policycoreutils package no longer offers restorecond
-	  as a option.  This package has been moved into a seperate
+	  as a option.  This package has been moved into a separate
 	  package maintained by the SELinux maintainers.
 
 config BR2_PACKAGE_SEPOLGEN
@@ -3940,7 +3940,7 @@ config BR2_GDB_VERSION_7_9
 comment "Legacy options removed in 2016.11"
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-	bool "PHP CGI and CLI options are now seperate"
+	bool "PHP CGI and CLI options are now separate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
 	select BR2_PACKAGE_PHP_SAPI_CGI
 	select BR2_LEGACY
@@ -4970,7 +4970,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_VUPLUS
 	select BR2_PACKAGE_KODI_PVR_WMC
 	help
-	  Kodi PVR addon was split into seperate modules
+	  Kodi PVR addon was split into separate modules
 
 config BR2_BINUTILS_VERSION_2_23_2
 	bool "binutils 2.23 option renamed"
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index a02aad4302..e82ca2e1ee 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -23,7 +23,7 @@ LEAFNODE2_CONF_OPTS = \
 	--enable-runas-user=root
 
 # Leafnode2 needs the host version of b_sortnl during
-# compilation. Instead of creating a seperate host package and
+# compilation. Instead of creating a separate host package and
 # installing b_sortnl to $(HOST_DIR) this binary is compiled
 # on-the-fly, host-pcre is needed for this
 define LEAFNODE2_BUILD_SORTNL_TOOL
diff --git a/system/Config.in b/system/Config.in
index 806a747315..731dceaa17 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -483,7 +483,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
 	default "C en_US"
 	depends on BR2_ENABLE_LOCALE_PURGE
 	help
-	  Whitespace seperated list of locales to allow on target.
+	  Whitespace separated list of locales to allow on target.
 	  Locales not listed here will be removed from the target.
 	  See 'locale -a' on your host for a list of locales available
 	  on your build host, or have a look in /usr/share/locale in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
