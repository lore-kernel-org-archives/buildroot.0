Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED243CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF71C614E5;
	Sat, 12 Oct 2024 15:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcJMo9t7ih2b; Sat, 12 Oct 2024 15:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C83E260D53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C83E260D53;
	Sat, 12 Oct 2024 15:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2966A1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 913C060679
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMNhCqJEn2iN for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3445960678
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3445960678
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D96B881357; Sat, 12 Oct 2024 15:07:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:29 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6c1790eaa60f9c530b8a1f7cab5b926a9b682ef5
X-Git-Newrev: 9061a97b9455deba3409fa690c009988e4916ad6
X-Patchwork-Hint: ignore
Message-Id: <20241012150759.D96B881357@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/qt5virtualkeyboard: fix 'Portuguese' typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=9061a97b9455deba3409fa690c009988e4916ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit e23e49e5d586755bbaa2c9ea73073433472102b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5virtualkeyboard/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
index 4cac6fd275..efe837e5f9 100644
--- a/package/qt5/qt5virtualkeyboard/Config.in
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS
 	  - Norwegian (nb_NO)
 	  - Persian/Farsi (fa_FA)
 	  - Polish (pl_PL)
-	  - Portugese (pt_PT)
+	  - Portuguese (pt_PT)
 	  - Romanian (ro_RO)
 	  - Russian (ru_RU)
 	  - Simplified Chinese (zh_CN)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
