Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8986BD12D49
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 563A580C50;
	Mon, 11 Nov 2024 14:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsPQ8e6L2Rah; Mon, 11 Nov 2024 14:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BCA80CB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BCA80CB2;
	Mon, 11 Nov 2024 14:36:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0021DE0B
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1FD7401CC
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADcC2SX_UOfr for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7C2040252
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C2040252
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1D686015; Mon, 11 Nov 2024 14:35:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 15:21:37 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 84c6d70256b1745e9a59ad977873d1e6c30b5075
X-Git-Newrev: cb52559946d50859dcb4d42ef08a3bf34f00944c
X-Patchwork-Hint: ignore
Message-Id: <20241111143551.9D1D686015@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/liblinear: change
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb52559946d50859dcb4d42ef08a3bf34f00944c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
