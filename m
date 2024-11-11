Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C56D2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5899A6064A;
	Mon, 11 Nov 2024 14:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWYZZy3JCMgH; Mon, 11 Nov 2024 14:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7F46067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7F46067A;
	Mon, 11 Nov 2024 14:36:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AD9DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2B2402DB
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cNp3gVOI6e1 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35732402DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35732402DA
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22D5686093; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 15:21:17 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 53b14b7cee597a835ea05e132154b4150bf2499f
X-Git-Newrev: 5ab7b6f267313cbfef1042af959bc9b054a32278
X-Patchwork-Hint: ignore
Message-Id: <20241111143552.22D5686093@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/liblinear: change
 homepage url to use https
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ab7b6f267313cbfef1042af959bc9b054a32278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The package homepage http url redirects to https. This commit updates
this url to directly use https.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5440d6c4464d8dd25c9315e49e97cd91884ccde2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblinear/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index cabcba05ad..8c112678cc 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBLINEAR
 	  liblinear is a linear classifier for data with millions of
 	  instances and features.
 
-	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
+	  https://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
 comment "liblinear needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
