Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A0BCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EAD2834FC;
	Sat, 18 Oct 2025 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq9jw8XMdGDu; Sat, 18 Oct 2025 15:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF21F834BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF21F834BA;
	Sat, 18 Oct 2025 15:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B29A71CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99AB7834BA
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLIU2dk3_uhY for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF73983487
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF73983487
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD7BC8748D; Sat, 18 Oct 2025 15:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 17:56:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7470587cfa9a24d3c49adc0fb6cc60512907f31a
X-Git-Newrev: 9d188bd4231816993de51b38894701788459b593
X-Patchwork-Hint: ignore
Message-Id: <20251018155752.BD7BC8748D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waffle: fix website reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d188bd4231816993de51b38894701788459b593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.waffle-gl.org yields "403 Forbidden".
Switch to freedesktop.org subdomain.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/waffle/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waffle/Config.in b/package/waffle/Config.in
index 79cb4ca2ed..c8661e1a0b 100644
--- a/package/waffle/Config.in
+++ b/package/waffle/Config.in
@@ -44,4 +44,4 @@ config BR2_PACKAGE_WAFFLE
 	  [1] http://piglit.freedesktop.org
 	  [2] http://github.com/apitrace/apitrace#readme
 
-	  http://www.waffle-gl.org
+	  https://waffle.freedesktop.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
