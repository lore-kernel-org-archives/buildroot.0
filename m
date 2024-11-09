Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1142CD5E378
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B838F42C05;
	Sat,  9 Nov 2024 17:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niqFxENul9cq; Sat,  9 Nov 2024 17:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6441542BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6441542BD5;
	Sat,  9 Nov 2024 17:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44412DAD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C99400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23VuKKZFVzHp for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33FF840260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33FF840260
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F56485ED0; Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 17:43:41 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: c33d41c4019cdb317b7cd6ceb12ec451e8bd6dd7
X-Git-Newrev: f92e435be398359b56c45e9170d8d3145a0cc624
X-Patchwork-Hint: ignore
Message-Id: <20241109171225.1F56485ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] DEVELOPERS: drop Anisse
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

commit: https://git.buildroot.net/buildroot/commit/?id=f92e435be398359b56c45e9170d8d3145a0cc624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

I am no longer actively involved in Buildroot.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91696fbcf1cefe35bf7134b981cdcc3175eb0770)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index faccdf60fb..8aee8d18ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,11 +240,6 @@ F:	package/sysdig/
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
