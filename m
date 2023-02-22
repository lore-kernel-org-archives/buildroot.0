Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E3C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB565415B7;
	Wed, 22 Feb 2023 16:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB565415B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y5mgHyFVzVP; Wed, 22 Feb 2023 16:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCBC340329;
	Wed, 22 Feb 2023 16:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBC340329
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28C581BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC996117E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC996117E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RF33z6sMZ6l for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A708F6117A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A708F6117A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96FD186759; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:54:42 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4adcd3c4b229bd73df34980160f7647606e50936
X-Git-Newrev: bcd81208ad9bbbd6368262a89b9a9122d5a4be1f
X-Patchwork-Hint: ignore
Message-Id: <20230222161022.96FD186759@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] *: fix typo for
 separate(d|) in text
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcd81208ad9bbbd6368262a89b9a9122d5a4be1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 4092d2a3546c1edfcb27f9d00fd4e7cac9878d2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                        | 4 ++--
 Config.in.legacy               | 6 +++---
 package/leafnode2/leafnode2.mk | 2 +-
 system/Config.in               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index e501fcb4c6..d8507a5a25 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7661,7 +7661,7 @@
 
 	Architecture: Default to bf532 CPU variant for blackfin,
 	Fix flat one memory region support for m68k and disable flat
-	seperate data support because of compatibility issues.
+	separate data support because of compatibility issues.
 
 	Defconfigs: Minnowboard and Raspberrypi: Fix errors with
 	post-build scripts when systemd is used.
@@ -8197,7 +8197,7 @@
 
 	Minor fixes.
 
-	Merged/seperate /usr handling is now also performed for
+	Merged/separate /usr handling is now also performed for
 	staging so cross-gdb / gdbserver can find the libraries.
 
 	Updated/fixed packages: autossh, conntrack-tools, dcron,
diff --git a/Config.in.legacy b/Config.in.legacy
index 49f63fd14c..40bbcd41ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3254,7 +3254,7 @@ config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	select BR2_PACKAGE_RESTORECOND
 	help
 	  The policycoreutils package no longer offers restorecond
-	  as a option.  This package has been moved into a seperate
+	  as a option.  This package has been moved into a separate
 	  package maintained by the SELinux maintainers.
 
 config BR2_PACKAGE_SEPOLGEN
@@ -3848,7 +3848,7 @@ config BR2_GDB_VERSION_7_9
 comment "Legacy options removed in 2016.11"
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-	bool "PHP CGI and CLI options are now seperate"
+	bool "PHP CGI and CLI options are now separate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
 	select BR2_PACKAGE_PHP_SAPI_CGI
 	select BR2_LEGACY
@@ -4878,7 +4878,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
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
index 888c24ce81..e6dcd25455 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -443,7 +443,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
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
