Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBFAD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56402412E6;
	Thu, 10 Oct 2024 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoFRURst01LQ; Thu, 10 Oct 2024 21:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B69412E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B69412E9;
	Thu, 10 Oct 2024 21:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B86751BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B441E412E9
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Urh8rGmgzh for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E04412E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7E04412E1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:50:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A314580807; Thu, 10 Oct 2024 21:50:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eee59812f0de4e0d049c6f9b7ac7e3cb651eb4fa
X-Git-Newrev: 2c09413b1015fbe1b1d9005194ad089b388908e8
X-Patchwork-Hint: ignore
Message-Id: <20241010215012.A314580807@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: bump to version
 5.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c09413b1015fbe1b1d9005194ad089b388908e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log:
https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 41c8498bec..35b116685f 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  141afc12b34a14bb691a939b4b122db0d51bd38feda7f41696822bacea7710c7  tesseract-ocr-5.3.4.tar.gz
+sha256  c4bc2a81c12a472f445b7c2fb4705a08bd643ef467f51ec84f0e148bd368051b  tesseract-ocr-5.4.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 0bc90f4871..b2cefcf2a0 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.3.4
+TESSERACT_OCR_VERSION = 5.4.1
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
