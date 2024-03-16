Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3432C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5564092F;
	Sat, 16 Mar 2024 22:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIMtvLbnP0TC; Sat, 16 Mar 2024 22:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1074099F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1074099F;
	Sat, 16 Mar 2024 22:02:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D16AF1BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE37B40342
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbfodZmF3uu7 for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E137040199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E137040199
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD502801F8; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:21:05 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5f687db36631fc014b2ea82380ee78663ddd79d3
X-Git-Newrev: 386ee165c10f2bbd215d1c6d405ff65ab5ed4e1d
X-Patchwork-Hint: ignore
Message-Id: <20240316220156.DD502801F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/google-breakpad:
 fix tools option identation in menuconfig
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
Content-Type: multipart/mixed; boundary="===============1322011393527341128=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1322011393527341128==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=386ee165c10f2bbd215d1c6d405ff65ab5ed4e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Move comment in Config.in to end of file so that
BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS is properly idented.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2c6dc1fed354696a706fe5ecc93c4089b8bd64bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/google-breakpad/Config.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 49d0bc06de..f03648e936 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -34,14 +34,6 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
-	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
 if BR2_PACKAGE_GOOGLE_BREAKPAD
 
 config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
@@ -51,3 +43,11 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
 	  minidump_stackwalk and microdump_stackwalk.
 
 endif
+
+comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

--===============1322011393527341128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1322011393527341128==--
