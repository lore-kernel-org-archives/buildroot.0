Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17218C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 07:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD8941176;
	Fri,  8 Jul 2022 07:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD8941176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JjZ36vTJ_zu; Fri,  8 Jul 2022 07:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5B6940500;
	Fri,  8 Jul 2022 07:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B6940500
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C82BA1C11A5
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A8A423AF
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 07:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A8A423AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7teatUxaF6s for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 07:36:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B2F41BBE
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 07:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B2F41BBE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD10982DC8; Fri,  8 Jul 2022 07:23:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 09:34:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5adc9b658fc137d5952f9bdea8dc9a4d007d5fc
X-Git-Newrev: f941dfb61f008ade087130f0c82d80d32c57af2c
X-Patchwork-Hint: ignore
Message-Id: <20220708072313.AD10982DC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x264: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=f941dfb61f008ade087130f0c82d80d32c57af2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index f1396279f8..f8b26b6910 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58f39bf23a4e38ac3dd841a3f9ccf2aa16d2b0c35df9aecd9f3b5062780e5d74  x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b-br1.tar.gz
+sha256  e83cda2a69e72bc45bcb14aa7ca5e689cf0f67dc29fc6f1dce63abe2a428fc01  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 9de618eb5e..97caf19466 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 35417dcd65a57321fbadf98c9a4cff1cb741db4b
+X264_VERSION = baee400fa9ced6f5481a728138fed6e867b0ff7f
 X264_SITE = https://code.videolan.org/videolan/x264.git
 X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
