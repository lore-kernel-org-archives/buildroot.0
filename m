Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F36C78822
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5AC42B8B;
	Fri, 20 Sep 2024 10:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nt2UqwOyrCpY; Fri, 20 Sep 2024 10:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1212142BEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1212142BEB;
	Fri, 20 Sep 2024 10:35:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20FDA1BF982
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA3C402AD
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyrXNU-NBGaI for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F997403C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F997403C2
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE396835DD; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:34:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1237764fadb10a74726d6a12bc67a98ea3447ac9
X-Git-Newrev: f33249f49c58e81ece18a8c1b35b94d1dbd87512
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.EE396835DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/madplay: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=f33249f49c58e81ece18a8c1b35b94d1dbd87512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
