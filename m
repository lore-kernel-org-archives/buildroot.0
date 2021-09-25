Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B30CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E2E60F26
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63E2E60F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2CB40428;
	Sat, 25 Sep 2021 14:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fu6GhUhDY42h; Sat, 25 Sep 2021 14:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9773140421;
	Sat, 25 Sep 2021 14:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75EE11BF95A
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 621164011C
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNp3iANNVLph for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:31:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94B32400D0
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:31:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F36CA882E2; Sat, 25 Sep 2021 14:29:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 16:31:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dafd86d47f3ca832b74747f157073e1a8b1aa934
X-Git-Newrev: 0f6b4a67b7003e2b564e59d89c13e35059c747a3
X-Patchwork-Hint: ignore
Message-Id: <20210925142912.F36CA882E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Baruch Siach from
 openipmi
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f6b4a67b7003e2b564e59d89c13e35059c747a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb211830a8..56e129d4f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -294,7 +294,6 @@ F:	package/ebtables/
 F:	package/i2c-tools/
 F:	package/libcurl/
 F:	package/libpcap/
-F:	package/openipmi/
 F:	package/socat/
 F:	package/strace/
 F:	package/tcpdump/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
