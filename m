Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E1C3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 06:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC1060ABB;
	Tue,  9 Jul 2024 06:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrwATWEr0VI6; Tue,  9 Jul 2024 06:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32F560B06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32F560B06;
	Tue,  9 Jul 2024 06:34:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3A921BF97E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B032980B9A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 208YLHzxGSgL for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 06:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C437F80B60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C437F80B60
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 06:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFC0384013; Tue,  9 Jul 2024 06:33:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 08:29:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55b1e893ef7584d32aa8882401918aee7e823c7
X-Git-Newrev: 61fc8632d389a9464132c40b75eeafa6b1393d44
X-Patchwork-Hint: ignore
Message-Id: <20240709063358.BFC0384013@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=61fc8632d389a9464132c40b75eeafa6b1393d44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.
Renumbered remaining patches.

Release notes:
- https://www.samba.org/samba/history/samba-4.20.0rc1.html
- https://www.samba.org/samba/history/samba-4.20.0rc2.html
- https://www.samba.org/samba/history/samba-4.20.0rc3.html
- https://www.samba.org/samba/history/samba-4.20.0rc4.html
- https://www.samba.org/samba/history/samba-4.20.0.html
- https://www.samba.org/samba/history/samba-4.20.1.html
- https://www.samba.org/samba/history/samba-4.20.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  5 +--
 ...re-built-heimdal-build-tools-in-case-of-.patch} |  0
 .../0001-libreplace-disable-libbsd-support.patch   | 46 ----------------------
 ...e_test.c-include-stdint.h-before-cmoka.h.patch} |  0
 package/samba4/samba4.hash                         |  4 +-
 package/samba4/samba4.mk                           |  2 +-
 6 files changed, 5 insertions(+), 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 505725695c..471b049ca6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1281,9 +1281,8 @@ package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
-package/samba4/0001-libreplace-disable-libbsd-support.patch lib_patch.Upstream
-package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
-package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
+package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
+package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
 package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/sane-backends/0001-sane_backend-add-missing-config.h.patch lib_patch.Upstream
 package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch lib_patch.Upstream
diff --git a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
similarity index 100%
rename from package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
rename to package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
deleted file mode 100644
index 8259e91fc6..0000000000
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4df82c9e03b68dc1621fe4c9ac6a29ae3e64e07e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 7 Sep 2016 23:03:43 -0300
-Subject: [PATCH] libreplace: disable libbsd support
-
-Disable libbsd support, samba4 uses a global config.h for its own
-codebase and that of heimdal (when building with builtin).
-This causes redefinition conflicts for link(2) when both standard
-unistd.h and bsd/unistd.h get included.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: rebased for versions 4.7.3, 4.8.0, 4.8.5 & 4.11.13]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/replace/wscript | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 240d730cbee..c6d8df43c74 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
-@@ -436,21 +436,6 @@ def configure(conf):
- 
-     strlcpy_in_bsd = False
- 
--    # libbsd on some platforms provides strlcpy and strlcat
--    if not conf.CHECK_FUNCS('strlcpy strlcat'):
--        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
--                               checklibc=True):
--            strlcpy_in_bsd = True
--    if not conf.CHECK_FUNCS('getpeereid'):
--        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
--        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS('setproctitle_init'):
--        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
--
-     conf.CHECK_CODE('''
-                 struct ucred cred;
-                 socklen_t cred_len;
--- 
-2.20.1
-
diff --git a/package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
similarity index 100%
rename from package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
rename to package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 49ce47705d..353736f3b2 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.6.tar.asc
-sha256  653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1  samba-4.19.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.2.tar.asc
+sha256  f969ffed58ccf3e85cbbcc0e33a1726d025c2b40f42a653b1125b82b92d2e0e5  samba-4.20.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 994037c84b..5536b6b121 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.6
+SAMBA4_VERSION = 4.20.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
