Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E7C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E616540376;
	Sun, 25 Sep 2022 08:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E616540376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3uNw1fJKcj1; Sun, 25 Sep 2022 08:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22788402BC;
	Sun, 25 Sep 2022 08:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22788402BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71B331BF97F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4407C4174D
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4407C4174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F1UKqXXmxYV for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45EED41736
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45EED41736
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 312FD85FCB; Sun, 25 Sep 2022 08:20:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 10:18:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eedd93f010ef7d385290805a6d040e7cfdf88d6b
X-Git-Newrev: f85e2cfc6e587d50b86f49b28469eae58a2ea2c7
X-Patchwork-Hint: ignore
Message-Id: <20220925082044.312FD85FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: renumber patch 0001 to 0002
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

commit: https://git.buildroot.net/buildroot/commit/?id=f85e2cfc6e587d50b86f49b28469eae58a2ea2c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is already another 0001 patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ace-support.patch => 0002-check-if-uclibc-has-backtrace-support.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/nodejs/0001-check-if-uclibc-has-backtrace-support.patch b/package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
similarity index 100%
rename from package/nodejs/0001-check-if-uclibc-has-backtrace-support.patch
rename to package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
