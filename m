Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B53FDEE48
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A440183DD2;
	Thu, 23 Apr 2026 20:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7hNLe8YBxOJ; Thu, 23 Apr 2026 20:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410F783DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976407;
	bh=OiIRPlbfHyqP52kPjJlttxwgEApREZtfO6TN7itnl64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OYQ2VANWOrbHB+EQJZBC1HEhosO1gaBy+SJ6QNEUFMJX7J32jQ2X9yyDvSlBGu6Zg
	 jJ4GChiAVD4WrdC9TYEP3Pr61vI9jM11kwd334e1x/HSp7+tNqsUg9tgyKmMI2IX//
	 BLIxZnDolMUpac61RZY+yNkwTDoUCQFBvooPiedvl4jwRm56/QLAeZrnYWUB2mQwDI
	 TZf4M720U8lWJ8JxA13UpSikbmttoDzp3itpG8RU8b4sHv6loLU1Mau57G9Rzi3LeL
	 lt3oQWRHpNCC+9Di9CXzbhsXk8pFu3On7RFUZ3nxlmvThNbkI8Q897rspiZ27NuFcy
	 qRGTosWC7wf4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410F783DCB;
	Thu, 23 Apr 2026 20:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 614C0206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47271408F5
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDrUfXIuoa5E for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680C140108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680C140108
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1082F828DA; Thu, 23 Apr 2026 20:33:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:32:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85f1e9cf0b9de205352ab013c4fe303b2f52b828
X-Git-Newrev: 6774a1e4c8442d187ce6839d9a1b6dc3d04d684c
X-Patchwork-Hint: ignore
Message-Id: <20260423203324.1082F828DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Clayton Shotwell,
 e-mail bounces
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6774a1e4c8442d187ce6839d9a1b6dc3d04d684c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

<clayton.shotwell@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.155.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index eba91f10a6..c6c228ae91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -703,19 +703,6 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
-N:	Clayton Shotwell <clayton.shotwell@collins.com>
-F:	package/audit/
-F:	package/checkpolicy/
-F:	package/cpio/
-F:	package/libcgroup/
-F:	package/libee/
-F:	package/libestr/
-F:	package/liblogging/
-F:	package/libselinux/
-F:	package/libsemanage/
-F:	package/libsepol/
-F:	package/policycoreutils/
-
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
