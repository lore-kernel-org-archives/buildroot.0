Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3CFE92735
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5AB242239;
	Thu,  5 Oct 2023 19:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5AB242239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-IXKIyIHYaH; Thu,  5 Oct 2023 19:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91E342717;
	Thu,  5 Oct 2023 19:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91E342717
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A22B21BF40E
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79F9B42717
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 19:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79F9B42717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhvfq3aJ9NGG for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 19:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A26A742239
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 19:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26A742239
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 918238426E; Thu,  5 Oct 2023 19:56:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Oct 2023 21:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8519de517e222c36108f0b573585de3057865ba7
X-Git-Newrev: 5bb58af5eb621084b7266c63bc8033d3e1736460
X-Patchwork-Hint: ignore
Message-Id: <20231005195603.918238426E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: fixes hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bb58af5eb621084b7266c63bc8033d3e1736460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: 74b50d553eaf ("package/tbb: bump to version 2021.10.0.")
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tbb/tbb.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 1caf81c5c5..085d54109a 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.10.0.tar.gz
+sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
