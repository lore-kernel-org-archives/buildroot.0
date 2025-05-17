Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E937C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 11:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 067A8831D6;
	Sat, 17 May 2025 11:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xad8u0o1wWH; Sat, 17 May 2025 11:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4CF4831B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CF4831B0;
	Sat, 17 May 2025 11:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E79D11DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B5E831CA
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsQRtiFmxz1T for <buildroot@buildroot.org>;
 Sat, 17 May 2025 11:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B4583196
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B4583196
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1420D86F0C; Sat, 17 May 2025 11:15:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 13:00:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4672e18ca1b2bb27f4eee2006168eaddecd465a3
X-Git-Newrev: 564ae5e1ca0ca82d1cdddfb642695a4d4b9ef1b5
X-Patchwork-Hint: ignore
Message-Id: <20250517111543.1420D86F0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqrencode: update Config.in
 homepage url
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
