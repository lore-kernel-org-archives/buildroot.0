Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E761CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE3341902;
	Thu, 19 Sep 2024 09:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pgYrojm-afo; Thu, 19 Sep 2024 09:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18AC43366
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F18AC43366;
	Thu, 19 Sep 2024 09:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3461A1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2388A841D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFIAtbuPA_aI for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7903C849EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7903C849EE
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75DAF7FC62; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 034b4230e06ac11c5158d28a0190ea0c6f32820c
X-Git-Newrev: 25dc8e2d6f725070cdaf812cd58b9e8c4bfaddfd
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.75DAF7FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/flutter-engine:
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

commit: https://git.buildroot.net/buildroot/commit/?id=25dc8e2d6f725070cdaf812cd58b9e8c4bfaddfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
