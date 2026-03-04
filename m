Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0026FEB7EA4
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2A88101C;
	Wed,  4 Mar 2026 08:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AwHlHXdK4PB; Wed,  4 Mar 2026 08:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FE58104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772612523;
	bh=Ff4Fpp3D82EEG4FNPeIWFPRrCtLnShRX0FrVt2LnlGY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKU2yzP5Fn01xqAiGeS+NrxhdyRDKK7kYSJpm/2rdlVTuUytJoJaueTrZ7J/QtV+N
	 9Zg6FgSOZgrQWMPHGWM7W9s+6kBbVDzV78YBS/HhEdS0Wxqq29ALJ2DAofRjGFJkNE
	 akREoP55BUb0cgfnmZ0NAVe5+r67vnQ2NXWkFric196A3IJnfqLI56NFDj08V3nHAb
	 qz5MFPycplZp4UYB/SSLLseXmb/mKIqf2NAxOnzU/NCLyLnF9wflJ0uNz/4/goo02l
	 XJ6CzopAwJMzhcUy9VODUxqnoEKnaR5jhU92VG52gB08ZbCKkZcf4BkhbG13GjChnH
	 ChtvcH/S1YpqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5FE58104F;
	Wed,  4 Mar 2026 08:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D00132F2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B65AB60693
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EBJGTVEnvC1 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189A2605FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 189A2605FA
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13892860E6; Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 09:21:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d374a736d88f37625c5c561d7c6bec9ab1f51ec4
X-Git-Newrev: bd715a60eafe87eb54c9fe57cf92dd8a56447223
X-Patchwork-Hint: ignore
Message-Id: <20260304082201.13892860E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2026.02
 announcement link
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd715a60eafe87eb54c9fe57cf92dd8a56447223
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 271c10f1b4..7cc9dd5761 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2026.02 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/CHANGES">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87ecm0huqz.fsf@dell.be.48ers.dk/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2026.02.tar.xz">2026.02 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
