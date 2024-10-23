Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F3CFA478
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9865340024;
	Wed, 23 Oct 2024 21:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OKpv810DXyf; Wed, 23 Oct 2024 21:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737B14002B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737B14002B;
	Wed, 23 Oct 2024 21:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 453DA27ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40A4460837
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrTKdBAptiFa for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F0DB605AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F0DB605AA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:14:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A32086444; Wed, 23 Oct 2024 21:14:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:13:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acdc6eba5ed8def2ba56ecce948d15b643240eba
X-Git-Newrev: 91696fbcf1cefe35bf7134b981cdcc3175eb0770
X-Patchwork-Hint: ignore
Message-Id: <20241023211427.7A32086444@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Anisse Astier
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

commit: https://git.buildroot.net/buildroot/commit/?id=91696fbcf1cefe35bf7134b981cdcc3175eb0770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am no longer actively involved in Buildroot.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 386b4ef38f..bebed80891 100644
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
