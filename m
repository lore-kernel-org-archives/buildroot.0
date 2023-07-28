Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75ACC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2C484095;
	Fri, 28 Jul 2023 19:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2C484095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ndk0Ae7B0_mn; Fri, 28 Jul 2023 19:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA55B84545;
	Fri, 28 Jul 2023 19:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA55B84545
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3CB1BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A5784095
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A5784095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbtD7IBlsXSx for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:22:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C8680D44
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C8680D44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F291F83831; Fri, 28 Jul 2023 19:22:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:21:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 007d3e2ffc9bf9238c8b18c7c1a1bcee82b6c9f3
X-Git-Newrev: e930965f546fde46b17131cf40394e7e8d5a9440
X-Patchwork-Hint: ignore
Message-Id: <20230728192223.F291F83831@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e930965f546fde46b17131cf40394e7e8d5a9440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ea3e60229bc5647e587685023de475276e28584d added a patch with a
wrong number.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Revert-Fix-static-builds.patch => 0005-Revert-Fix-static-builds.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libopenssl/0006-Revert-Fix-static-builds.patch b/package/libopenssl/0005-Revert-Fix-static-builds.patch
similarity index 100%
rename from package/libopenssl/0006-Revert-Fix-static-builds.patch
rename to package/libopenssl/0005-Revert-Fix-static-builds.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
