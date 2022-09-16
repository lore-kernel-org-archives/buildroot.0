Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23449ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1DA96121B;
	Fri, 16 Sep 2022 11:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DA96121B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K8K24UV6eOx; Fri, 16 Sep 2022 11:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B476106A;
	Fri, 16 Sep 2022 11:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B476106A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ECBB1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2742D41964
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2742D41964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHTfj4Dyl5nQ for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BAAA419E3
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAAA419E3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8361E83CC2; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:23:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e77e79886722aab8923d85ae82e6cfa153c09216
X-Git-Newrev: 9e0882a5cf63d434c5b53b1086f6ee8d38c71b06
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.8361E83CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tesseract-ocr:
 fix typo on BR2_PACKAGE_TESSERACT_OCR_LANG_GER
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e0882a5cf63d434c5b53b1086f6ee8d38c71b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The typo was added in 2017 by commit
'd1103eeab3 tesseract-ocr: new package'

Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 47e09eaee7dd582270e3f41865aef4f7db025ad4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index a7498931fb..5e9da0c648 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_FRA),y)
 TESSERACT_OCR_DATA_FILES += fra.traineddata
 endif
 
-ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_DEU),y)
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_GER),y)
 TESSERACT_OCR_DATA_FILES += deu.traineddata
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
