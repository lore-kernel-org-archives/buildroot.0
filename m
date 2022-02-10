Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61D6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7082982CF1;
	Thu, 10 Feb 2022 21:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weBv41rWC-FL; Thu, 10 Feb 2022 21:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A408082C84;
	Thu, 10 Feb 2022 21:22:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3074E1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F2A282C84
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgrT7UHPDQvS for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:22:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DCD282C04
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:22:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 34BE882235; Thu, 10 Feb 2022 21:15:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:20:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0309124a499b37c3fb253386ad88eca19fa065ef
X-Git-Newrev: c24eff63a8f5f4f06e95ed6c899e1813287e33a4
X-Patchwork-Hint: ignore
Message-Id: <20220210211521.34BE882235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to version 1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c24eff63a8f5f4f06e95ed6c899e1813287e33a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes see: https://github.com/rauc/rauc/releases/tag/v1.6

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index a025257845..f6c1446de4 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.5.1/rauc-1.5.1.tar.xz.asc
-sha256  d4ea009ce702bcb083d942398ccfedec959c6bbb7adc0fd77ae9314ce11d9d91  rauc-1.5.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
+sha256  86013788dd02321b7c3f913ad3a1f8802afbc784ec076fa278524a9e1ef9e7b0  rauc-1.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 99efc16c2f..39f5255812 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.5.1
+RAUC_VERSION = 1.6
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
