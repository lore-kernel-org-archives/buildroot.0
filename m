Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C65CCF9E9
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 16:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4C47810B3;
	Sat, 25 Oct 2025 16:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svJWNh_1raT2; Sat, 25 Oct 2025 16:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ADA381022
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ADA381022;
	Sat, 25 Oct 2025 16:58:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E88D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 009E540207
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWjsLldBywhX for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D8D40205
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D8D40205
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 054E587724; Sat, 25 Oct 2025 16:58:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 11:34:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cae850cd70a81bfd0a6fb9887d8a08671784303
X-Git-Newrev: 2726d965cdaa28c7c21929f4b0aff431304e5e3e
X-Patchwork-Hint: ignore
Message-Id: <20251025165815.054E587724@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Dario Binacchi for
 libgphoto2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2726d965cdaa28c7c21929f4b0aff431304e5e3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72..63afce3fac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -812,6 +812,7 @@ F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/less/
+F:	package/libgphoto2/
 F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
