Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE14C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 11:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D53640925;
	Tue,  6 Aug 2024 11:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJUTpqXJvHWv; Tue,  6 Aug 2024 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423F240432
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 423F240432;
	Tue,  6 Aug 2024 11:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4BC1BF306
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5635880E91
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrM5cIu29Drs for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 11:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D18C80E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D18C80E84
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 11:22:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73D428411D; Tue,  6 Aug 2024 11:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 12:16:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1498da3deeb64faa8afed2c715667cec496f72dd
X-Git-Newrev: 03505e34570d65ead565e13b0998b05a12ab95ac
X-Patchwork-Hint: ignore
Message-Id: <20240806112232.73D428411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: assign Adrian Perez for sysprof
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=03505e34570d65ead565e13b0998b05a12ab95ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e46beff00..76f7fc5ed6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -61,6 +61,7 @@ F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
 F:	package/libwpe/
+F:	package/sysprof/
 F:	package/webkitgtk/
 F:	package/wlroots/
 F:	package/woff2/
@@ -3295,7 +3296,6 @@ N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
 F:	package/erlang/
 F:	package/libmicrohttpd/
-F:	package/sysprof/
 F:	package/time/
 
 N:	Will Wagner <will_wagner@carallon.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
