Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DD3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1587261390
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1587261390
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89BE40783;
	Wed, 29 Sep 2021 15:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usIwShAZm8dJ; Wed, 29 Sep 2021 15:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E20040723;
	Wed, 29 Sep 2021 15:13:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39B361BF9AF
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8372983578
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXpGP4sYZlTX for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 15:07:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E2D28361C
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:07:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C50E8D4FD; Wed, 29 Sep 2021 15:05:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 17:00:27 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: fb6f66236d82b48f8822dd42cb2cf646ad69cba5
X-Git-Newrev: 962e030f0eb0cf67a43bb450410be6952a54231d
X-Patchwork-Hint: ignore
Message-Id: <20210929150504.4C50E8D4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/gst1-interpipe:
 bump version to 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=962e030f0eb0cf67a43bb450410be6952a54231d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit edb6d5f00b3563a8987a5d424f9149b39ce5eaf9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 124a2e4073..a84be7a085 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  2fd86aebfe03849a19e9d02db3a8f97bf6f77de835d36ae84282d6f734df323c  gst1-interpipe-1.1.4-br1.tar.gz
+sha256  4543b2872ee5985679375aa4e588b2dcf8b8c4f61f106655989c89f4aab0d736  gst1-interpipe-1.1.5-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index eb1e6dd533..8d1da080a1 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.4
+GST1_INTERPIPE_VERSION = 1.1.5
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
