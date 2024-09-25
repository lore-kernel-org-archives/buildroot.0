Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC27DCCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D89611FD;
	Wed, 25 Sep 2024 18:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEMFKTBO-XRM; Wed, 25 Sep 2024 18:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C257C611DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C257C611DC;
	Wed, 25 Sep 2024 18:55:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A97F91BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9825484AD5
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3zqB8efIu1b for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C575B84AC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C575B84AC8
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD433844B6; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:37:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6367eb49654f37ee8da58cbc62f6af22f7a22d6d
X-Git-Newrev: e23e49e5d586755bbaa2c9ea73073433472102b9
X-Patchwork-Hint: ignore
Message-Id: <20240925185456.BD433844B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5virtualkeyboard: fix
 'Portuguese' typo in help text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e23e49e5d586755bbaa2c9ea73073433472102b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
