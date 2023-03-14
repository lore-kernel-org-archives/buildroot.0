Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B25C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6339140541;
	Tue, 14 Mar 2023 08:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6339140541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 459oNt08x_po; Tue, 14 Mar 2023 08:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7195140315;
	Tue, 14 Mar 2023 08:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7195140315
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73F91BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10C04058D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B10C04058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVa1naZpOrw7 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3DE14011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DE14011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFDB987107; Tue, 14 Mar 2023 08:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:41:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27ea8958e1595a92b92f7057bcf005db0fa363f1
X-Git-Newrev: 97ce2f621d46a3da0e6149815d66d7ccfcf9c020
X-Patchwork-Hint: ignore
Message-Id: <20230314084212.BFDB987107@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: fix COPYING hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=97ce2f621d46a3da0e6149815d66d7ccfcf9c020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump in a1f0020 forgot to update the hash of the license
file.
Changes include updated copyright years for the different parties.

Fixes:
 - http://autobuild.buildroot.net/results/0d93b20995c2bfd2236d820a35e5eae9de76f00e

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index e881f58510..1e7a1cf530 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b  harfbuzz-7.1.0.tar.xz
-sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
+sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
