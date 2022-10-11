Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E02C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51EE340514;
	Tue, 11 Oct 2022 18:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51EE340514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGLIIEvi1nyt; Tue, 11 Oct 2022 18:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 650D740BF4;
	Tue, 11 Oct 2022 18:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 650D740BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFFBA1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C64418D2
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C64418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdlFOBHe7n0n for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF9E2418D0
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9E2418D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB2B486B93; Tue, 11 Oct 2022 18:48:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 20:34:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 374f83630bafe7371ecd751cf07e3e7c0ce1c71e
X-Git-Newrev: 0172690bcd7213624b639c5d7f6e1faeb7c76bbc
X-Patchwork-Hint: ignore
Message-Id: <20221011184828.AB2B486B93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nodejs: renumber
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

commit: https://git.buildroot.net/buildroot/commit/?id=0172690bcd7213624b639c5d7f6e1faeb7c76bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
