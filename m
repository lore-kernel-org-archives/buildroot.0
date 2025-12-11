Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D0D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007214116B;
	Thu, 11 Dec 2025 19:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKbo_6DDmykR; Thu, 11 Dec 2025 19:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1336641167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481414;
	bh=JU38BlVf/32feriiDaAii2DHES5GC2bS0B04d79o3rQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KH7mP2NenrizMXonyYgXchcfwyQPSWm1SyfTxv1fGMqZTw8yav4l3CHujf1UVHR83
	 b5zMiXJgkr8z6eu/5gPnNZngik9qiQwmZowJvRHmdfjZ6GZ83tP6m/nm7aB82wl/1k
	 C5Cm36dv5jmeiR60Nw3IBIBisyqy1VHmirRKm1ndY2QGX+xF35Qq1TADampKX2cnwX
	 hdnwfR32KQMOm5CKOw0DC6wMqk/4azpQxKfzvhfZA1UqLXiaJi7vRhuQNoKRJ4hHdt
	 8XpPqAWZSe1S6YElvJw/7Vwn7bPQYw31+G/ds1+I190c6fiTGsIJbEvCqwmsszQqmm
	 8OYQqJCviN5UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1336641167;
	Thu, 11 Dec 2025 19:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4477F2E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B74D6809E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38_dHfKujrqo for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B32280DA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B32280DA6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A7F086BE8; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:36 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 2270004c9b206d4a94e59c779e7b6e52399a768b
X-Git-Newrev: c6f1bc8cb7ac5ecf242a1bc22ba023119d02b763
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.4A7F086BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: remove Prabhu
 Sannachi, bouncing e-mail
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6f1bc8cb7ac5ecf242a1bc22ba023119d02b763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
entry:

<prabhu.sannachi@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d61edf6b1b5b23f285f30f67a2d67695b153909)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb23d93de4..387cd06274 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2762,9 +2762,6 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
-N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
-F:	package/redis-plus-plus/
-
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
