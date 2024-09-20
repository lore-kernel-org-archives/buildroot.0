Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503B8C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD3142CBB;
	Fri, 20 Sep 2024 10:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfdGYzWtzmDq; Fri, 20 Sep 2024 10:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8685042CD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8685042CD4;
	Fri, 20 Sep 2024 10:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B20E51BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD7D60811
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tYtexToreLj for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B214D615EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B214D615EE
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF0858411D; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:39 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1e32ef4c1456fc490baf00c6af9d90a7ca744c41
X-Git-Newrev: 40afb3d5b52cd49efbd13f9f894ccfb87d7b2b79
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.AF0858411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/madplay: fix
 typos in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=40afb3d5b52cd49efbd13f9f894ccfb87d7b2b79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2465cdb48ac0b3c720e736656e1776affa7bad4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch | 2 +-
 package/madplay/madplay.mk                                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
index 7d3fb8ddc6..448139e0ba 100644
--- a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
+++ b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
@@ -3,7 +3,7 @@ configure.ac: call AM_MKINSTALLDIRS to substitute @MKINSTALLDIRS@
 MKINSTALLDIRS is obsolete and doesn't get automatically called.
 
 Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
-occurence in *.in files.
+occurrence in *.in files.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 91ee44ab5f..b9162dd2fd 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -18,7 +18,7 @@ MADPLAY_AUTORECONF = YES
 # madplay uses libmad which has some assembly function that is not present in
 # Thumb mode:
 # Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
-# so, we desactivate Thumb mode
+# so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
