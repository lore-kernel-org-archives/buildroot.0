Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236E0C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7FAA81E77;
	Tue,  8 Nov 2022 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FAA81E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uF1NlIkTtTwA; Tue,  8 Nov 2022 20:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7A181DFB;
	Tue,  8 Nov 2022 20:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7A181DFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 486491BF957
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24F4D404D8
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24F4D404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1AJ0_JzHmlA for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:07:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D40403B7
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D40403B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E112180FAB; Tue,  8 Nov 2022 20:07:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:07:18 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 822050f03406f8fc65ac8ecb1194dd643597954a
X-Git-Newrev: 67d3eec6b92c0c385636d35ae7b3c5b837233baa
X-Patchwork-Hint: ignore
Message-Id: <20221108200736.E112180FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: add Bernd
 Kuhls to package rsync
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

commit: https://git.buildroot.net/buildroot/commit/?id=67d3eec6b92c0c385636d35ae7b3c5b837233baa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 098db8b4d5649345f983e7601d60a1fc30836e1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 81f33fe117..74a9839b3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -445,6 +445,7 @@ F:	package/python-pyicu/
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
