Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5119AC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0ACB60BC2;
	Sat, 29 Oct 2022 16:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0ACB60BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akAauw52HWQf; Sat, 29 Oct 2022 16:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3206060B42;
	Sat, 29 Oct 2022 16:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3206060B42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 350AF1BF954
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A90E404DB
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A90E404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zulLRxk4lUH for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58889404C8
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58889404C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B508718B; Sat, 29 Oct 2022 16:11:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:10:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96db6a8ac96742cb817f87ce4c869677c6a6cfda
X-Git-Newrev: 098db8b4d5649345f983e7601d60a1fc30836e1d
X-Patchwork-Hint: ignore
Message-Id: <20221029161122.41B508718B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Bernd Kuhls to package
 rsync
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

commit: https://git.buildroot.net/buildroot/commit/?id=098db8b4d5649345f983e7601d60a1fc30836e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dac8fefd0b..c4d23cd293 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -447,6 +447,7 @@ F:	package/python-pyicu/
 F:	package/python-pylru/
 F:	package/python-requests-oauthlib/
 F:	package/python-slob/
+F:	package/rsync/
 F:	package/rtmpdump/
 F:	package/samba4/
 F:	package/softether/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
