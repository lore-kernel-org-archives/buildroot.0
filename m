Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33112FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6A9841F5;
	Sun,  3 May 2026 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndJeJ-UE4_SL; Sun,  3 May 2026 16:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDF883927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777827413;
	bh=ET+rMPKDgeMn3DKxHwZgxpIbquhWxGRXr5P1lPwZBbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=klYxY5pRTLqONxshWnEaPKOP0EB1JryHEj01JUwpB0m5X31MDdfz2tt6FuasqssTv
	 VGHK6y4jYgyOTZA4Vio7s6R1sLncYD3L0pQo6OEUJ0Tbe3/UGWSIplHzV1jLIhR66w
	 8gUHzC7FkaRsjTpIZBytZhVbmwn057fOkBB3UgOEJ65Lz4pZAhTFj9XA+3MZ5w+lGT
	 cw2hGk5ibh+pJ+s7ZalD6DSSSQVH9NOVM0rKbiMhiCFoW7vx7dYjDh/mChHyEpazUF
	 2ZSV1Ycb91PMPfsDjlgIod06RXm7aAyhf2/wAoj1DvDW/qXjtONV1Tud5ea5bAcHS/
	 iThVrntqA+Row==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDF883927;
	Sun,  3 May 2026 16:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F1A25D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9682983927
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLAsOhpkkqyt for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E734B83299
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E734B83299
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6DD83F79; Sun,  3 May 2026 16:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:50:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deda2e8e204d3dd527abc339e99785de0eb29dbb
X-Git-Newrev: 9f3097bcf69166e6341806537a09ff4414840b61
X-Patchwork-Hint: ignore
Message-Id: <20260503165651.AD6DD83F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Shubham Chakraborty as
 dos2unix maintainer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f3097bcf69166e6341806537a09ff4414840b61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add entry for package/dos2unix/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd973d7f86..179cdf50f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3050,6 +3050,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/dos2unix/
 F:	package/hyperfine/
 F:	package/pv/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
