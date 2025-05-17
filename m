Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D33C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72168404A;
	Mon, 19 May 2025 11:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KghozwUwD-if; Mon, 19 May 2025 11:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E358488E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E358488E;
	Mon, 19 May 2025 11:03:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EF6D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4681841DEC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QP8oniXKE3tS for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A472D411DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A472D411DA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D0781E90; Mon, 19 May 2025 10:40:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 13:00:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4672e18ca1b2bb27f4eee2006168eaddecd465a3
X-Git-Newrev: 564ae5e1ca0ca82d1cdddfb642695a4d4b9ef1b5
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.A2D0781E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libqrencode: update
 Config.in homepage url
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=564ae5e1ca0ca82d1cdddfb642695a4d4b9ef1b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The old home page url [1] redirects to https, and points to the
japanese version of the site.

The commit updates this url to the https english version of the
site [2].

[1] http://fukuchi.org/works/qrencode/index.html
[2] https://fukuchi.org/en/works/qrencode/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqrencode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
index b86662621e..7c3d9e4df6 100644
--- a/package/libqrencode/Config.in
+++ b/package/libqrencode/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBQRENCODE
 	  QR Code is up to 7000 digits or 4000 characters, and is
 	  highly robust.
 
-	  http://fukuchi.org/works/qrencode/index.html
+	  https://fukuchi.org/en/works/qrencode/
 
 if BR2_PACKAGE_LIBQRENCODE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
