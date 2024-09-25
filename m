Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C9ECCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E43607C8;
	Wed, 25 Sep 2024 18:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzfaGadk8_e7; Wed, 25 Sep 2024 18:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8067F611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8067F611C9;
	Wed, 25 Sep 2024 18:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2831BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86487611D2
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rtz6WjRHu-Ja for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58D7607C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58D7607C8
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F41838DB; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:37:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7426aaddeea3da229aa42310cb890cec56e4fbdb
X-Git-Newrev: 6367eb49654f37ee8da58cbc62f6af22f7a22d6d
X-Patchwork-Hint: ignore
Message-Id: <20240925185456.B2F41838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5connectivity: fix 'peripherals'
 typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=6367eb49654f37ee8da58cbc62f6af22f7a22d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qt5/qt5connectivity/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 244d01676d..1ac77d7b32 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	  developers using C++.
 
 	  Qt Connectivity module provides support for Bluetooth/NFC
-	  peripherials.
+	  peripherals.
 
 	  https://doc.qt.io/qt-5/qtbluetooth-index.html
 	  https://doc.qt.io/qt-5/qtnfc-index.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
