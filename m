Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B75FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:03:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494E160D43
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 494E160D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0798460822;
	Sun, 24 Oct 2021 14:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dpt6iUXlKklj; Sun, 24 Oct 2021 14:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DD9607E6;
	Sun, 24 Oct 2021 14:03:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32C6F1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2243380F1F
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2aAerzkieAx for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:03:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E40F80F1E
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:03:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B5F47885D6; Sun, 24 Oct 2021 14:00:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5c8b0bac8849f0e226345b4c5d3a623b1aad5c4
X-Git-Newrev: 226d5b3b95c1c54449c31358c888640281d45a33
X-Patchwork-Hint: ignore
Message-Id: <20211024140006.B5F47885D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.txt: fix typo
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
Content-Type: multipart/mixed; boundary="===============0733094017362581208=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0733094017362581208==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=226d5b3b95c1c54449c31358c888640281d45a33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 

--===============0733094017362581208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0733094017362581208==--
