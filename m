Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554FC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D28400EA;
	Wed, 17 Jul 2024 21:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkUWXhR7YHui; Wed, 17 Jul 2024 21:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE5F40C0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE5F40C0E;
	Wed, 17 Jul 2024 21:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F391A1BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB84D40C0E
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeZeloTPxCTx for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E98400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E98400C1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:00:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C4386D07; Wed, 17 Jul 2024 21:00:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 22:59:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0aae3e42403277d033e371d49b1cb27954a28a7
X-Git-Newrev: 01eb0e21a167eeda78ba79c4976a573d537cf04a
X-Patchwork-Hint: ignore
Message-Id: <20240717210034.00C4386D07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6opcua: fix indentation of
 comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01eb0e21a167eeda78ba79c4976a573d537cf04a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was intended with spaces instead of a tab.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6opcua/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
index 84a51f544f..68b73f7c50 100644
--- a/package/qt6/qt6opcua/Config.in
+++ b/package/qt6/qt6opcua/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_QT6OPCUA
 	bool "qt6opcua"
 	select BR2_PACKAGE_QT6BASE_NETWORK
-        # qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
-        # network support in qt6base.
+	# qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
+	# network support in qt6base.
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
 
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
