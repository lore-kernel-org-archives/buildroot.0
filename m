Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC38CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A84C7410F9;
	Thu, 19 Sep 2024 09:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KboOCacpscoL; Thu, 19 Sep 2024 09:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F8A41451
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F8A41451;
	Thu, 19 Sep 2024 09:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4ABB1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3384427FD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj8ndhL2e4zq for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7D642800
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE7D642800
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAEA583C67; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:29 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 17076edc906efe2554f31f14d90dcb5717b3ce5a
X-Git-Newrev: c299d465b8d3de1b4e3765815ac3931b8a59c117
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.EAEA583C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/flutter-engine:
 fix typos in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=c299d465b8d3de1b4e3765815ac3931b8a59c117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cccd164fd63010ac01c8c797203362f0c3bfa7ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-engine/Config.in   | 2 +-
 package/flutter-engine/gen-tarball | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
index 00bcd05cd4..610c26d933 100644
--- a/package/flutter-engine/Config.in
+++ b/package/flutter-engine/Config.in
@@ -1,4 +1,4 @@
-# Flutter includes a vender copy of clang which is mandatory to use for
+# Flutter includes a vendor copy of clang which is mandatory to use for
 # compiling. These are the supported architectures.
 config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	bool
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 23b121d1f9..5bfb8f60e8 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -66,10 +66,10 @@ gen_tarball() {
     # There are two issues with the flutter-engine buildsystem:
     # - it expects empty directories created by gclient.py to be present; that
     #   means we can't use the mk_tar_gz helper method from support/download/helpers,
-    #   becasue it does not include emnpty directories;
+    #   because it does not include empty directories;
     # - it insists on having a full git repositoy, with .git et al., which means
     #   we can't generate a reproducible archive anyway.
-    # So we jsut create a plain tarball.
+    # So we just create a plain tarball.
     ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
