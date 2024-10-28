Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2421D33992
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97720403A5;
	Mon, 28 Oct 2024 14:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSNYdLMA_n3i; Mon, 28 Oct 2024 14:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D605402A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D605402A3;
	Mon, 28 Oct 2024 14:47:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F107F4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1AED4036A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elKGERIoV0Ww for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3315400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3315400D8
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:47:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E069C84354; Mon, 28 Oct 2024 14:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 15:46:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653c3d39a633a2106d50baa2625cb126bbb53d57
X-Git-Newrev: 04141fdcab49608102e62aee3615dff7c5017ed1
X-Patchwork-Hint: ignore
Message-Id: <20241028144701.E069C84354@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bernd Kuhls from libglfw
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

commit: https://git.buildroot.net/buildroot/commit/?id=04141fdcab49608102e62aee3615dff7c5017ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ad5540dc9..9743ae30d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -418,7 +418,6 @@ F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
-F:	package/libglfw/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
