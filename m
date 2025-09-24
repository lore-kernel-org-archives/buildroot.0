Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72393CAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2016408F9;
	Wed, 24 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WinY8eB8ERvL; Wed, 24 Sep 2025 19:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BBD406C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BBD406C6;
	Wed, 24 Sep 2025 19:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D722412D
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0F040670
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAFyHlY8dS3I for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D413F405AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D413F405AF
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C440F863AD; Wed, 24 Sep 2025 19:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Sep 2025 19:45:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d36a4133f2304d9cbaa7632ea794280095898a
X-Git-Newrev: d2bd4655259299fded94727e94a4fa4389113202
X-Patchwork-Hint: ignore
Message-Id: <20250924190107.C440F863AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Dario Binacchi for bc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2bd4655259299fded94727e94a4fa4389113202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8403db636f..9094973fdf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -807,6 +807,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
+F:	package/bc/
 F:	package/cmocka/
 F:	package/connman/
 F:	package/iana-assignments/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
