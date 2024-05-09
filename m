Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9495C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607AA81AF3;
	Thu,  9 May 2024 15:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7bf78gNp4aV; Thu,  9 May 2024 15:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2875381A33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2875381A33;
	Thu,  9 May 2024 15:59:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7031BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58CBC4057C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZBv_IExuOx1 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8367C40190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8367C40190
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:59:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3313A86C54; Thu,  9 May 2024 15:59:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:57:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fd8391ab3d6bb3d65d7d2ca324e267f8c982226
X-Git-Newrev: e37b39d4fddca6697ab2016c0366f0ed154ee768
X-Patchwork-Hint: ignore
Message-Id: <20240509155924.3313A86C54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fft-eval: bump version to 777749c
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

commit: https://git.buildroot.net/buildroot/commit/?id=e37b39d4fddca6697ab2016c0366f0ed154ee768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only one commit since last version:

- 777749c fft_eval: ignore spectral data containing zero noise floor values
  (see [1])

[1] https://github.com/simonwunderlich/FFT_eval/commit/777749c5c7cc0af1fe5a74e3c589581eabcf0f1e

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fft-eval/fft-eval.hash | 2 +-
 package/fft-eval/fft-eval.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fft-eval/fft-eval.hash b/package/fft-eval/fft-eval.hash
index 1ffa854be3..a88bd0d73f 100644
--- a/package/fft-eval/fft-eval.hash
+++ b/package/fft-eval/fft-eval.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  154f99c3567835bbbbc9ec4c58bc79961f9fa5342effb6f0bc41475fc9a6d11f  fft-eval-6a82b383ce79afc4c1ba26ffcf34b15d3e95894b.tar.gz
+sha256  2ab485df3489f82aee810794f154565a09fbb8c8ef22ee1c7b08ad8bce89bd51  fft-eval-777749c5c7cc0af1fe5a74e3c589581eabcf0f1e.tar.gz
 sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
 sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
 sha256  797832eda5ff4360a10fee3be94a3250995e76423b79675c9c44204c37ca492d  LICENSES/OFL-1.1.txt
diff --git a/package/fft-eval/fft-eval.mk b/package/fft-eval/fft-eval.mk
index 5f913391e3..a79cbe3e0a 100644
--- a/package/fft-eval/fft-eval.mk
+++ b/package/fft-eval/fft-eval.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
+FFT_EVAL_VERSION = 777749c5c7cc0af1fe5a74e3c589581eabcf0f1e
 FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
 FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0, OFL-1.1 (LiberationSans-Regular.ttf)
 FFT_EVAL_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
