Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CE0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A61E61163
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A61E61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D9360A35;
	Tue, 26 Oct 2021 12:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3_d8rEkYyfy; Tue, 26 Oct 2021 12:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8453660632;
	Tue, 26 Oct 2021 12:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F14401BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0C2540485
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWl59VMD3SAk for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5304B4026D
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F51188DA1; Tue, 26 Oct 2021 12:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:12:11 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6187d3465e2c3216557fac3113b06ae1011a7623
X-Git-Newrev: c2cfab554010ade6ef033684ec518a5c0ab5a382
X-Patchwork-Hint: ignore
Message-Id: <20211026121221.1F51188DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 docs/manual/contribute.txt: fix typo
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
Content-Type: multipart/mixed; boundary="===============2046572487547894310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2046572487547894310==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c2cfab554010ade6ef033684ec518a5c0ab5a382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 226d5b3b95c1c54449c31358c888640281d45a33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 14ecdbd66c..e58e75d96d 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -610,7 +610,7 @@ be the maintainer of that test case.
 Within the Buildroot repository, the testing framework is organized at the
 top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
 All the test cases live under the +test+ folder and are organized in various
-folders representing the catagory of test.
+folders representing the category of test.
 
 Lets walk through an example.
 

--===============2046572487547894310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2046572487547894310==--
