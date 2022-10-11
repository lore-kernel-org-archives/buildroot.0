Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7FEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD26940BD3;
	Tue, 11 Oct 2022 18:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD26940BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOkSAz9N5wfW; Tue, 11 Oct 2022 18:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6DE440524;
	Tue, 11 Oct 2022 18:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6DE440524
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59EB01C1135
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34D8E418D2
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D8E418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYClxHc0_C3w for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DEF7418CE
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DEF7418CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 392AE86BCF; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 20:11:52 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 25d865996d1d9753fe7d4dfe39cf18c7e9f91224
X-Git-Newrev: b0700755ae1d564581f6e224dca6f9dc1c0a496c
X-Patchwork-Hint: ignore
Message-Id: <20221011185356.392AE86BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: renumber
 patch 0001 to 0002
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0700755ae1d564581f6e224dca6f9dc1c0a496c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

There is already another 0001 patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f85e2cfc6e587d50b86f49b28469eae58a2ea2c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
