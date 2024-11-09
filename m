Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7867D5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7A084647;
	Sat,  9 Nov 2024 17:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loki2OTSSkFT; Sat,  9 Nov 2024 17:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9368465D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9368465D;
	Sat,  9 Nov 2024 17:13:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20910D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB358465D
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXD3xQAUkp2x for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F1084647
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43F1084647
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31BA785F0B; Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 17:43:36 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f0d7171ad9552f8a4f54758f53cef51391cea298
X-Git-Newrev: 9db028f8a2bdc28fc34d3ee792135526d719afec
X-Patchwork-Hint: ignore
Message-Id: <20241109171330.31BA785F0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop Anisse
 Astier
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

commit: https://git.buildroot.net/buildroot/commit/?id=9db028f8a2bdc28fc34d3ee792135526d719afec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

I am no longer actively involved in Buildroot.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91696fbcf1cefe35bf7134b981cdcc3175eb0770)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f976f16c2b..423ad7513a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -224,11 +224,6 @@ F:	package/sysdig/
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
 
-N:	Anisse Astier <anisse@astier.eu>
-F:	package/go/
-F:	package/nghttp2/
-F:	package/pkg-golang.mk
-
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
