Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7224C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCCB84A47;
	Fri, 22 Jul 2022 20:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCCB84A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJn6Ua_fpviA; Fri, 22 Jul 2022 20:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6CF848EB;
	Fri, 22 Jul 2022 20:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6CF848EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2617E1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0099C848EB
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0099C848EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i25vsGpCfr0l for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:53:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 511E4848E7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 511E4848E7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F199A84198; Fri, 22 Jul 2022 20:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 22:53:05 +0200
Subject: [git commit] DEVELOPERS: add Raphaël Mélotte as developer for python-s3transfer test
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 727889c87975530d084d156689eb6b6ffbe8f4f9
X-Git-Newrev: be58fd1e0cd941e186e1bfc6c5fb9d33786fd017
X-Patchwork-Hint: ignore
Message-Id: <20220722204008.F199A84198@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=be58fd1e0cd941e186e1bfc6c5fb9d33786fd017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Follows c15734e3d25c7b7ee97a7a48d45457b926daf159 ("support/testing:
add new test for python-s3transfer")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c3c24ff7a..55406892c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2436,7 +2436,9 @@ F:	package/python-pymupdf/
 F:	package/python-rsa/
 F:	package/python-s3transfer/
 F:	support/testing/tests/package/sample_python_rsa.py
+F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/test_python_rsa.py
+F:	support/testing/tests/package/test_python_s3transfer.py
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
