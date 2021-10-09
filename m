Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E575EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370776108B
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 18:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 370776108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0595F82AA9;
	Sat,  9 Oct 2021 18:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HNXMj_8pAZH; Sat,  9 Oct 2021 18:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F5182A2E;
	Sat,  9 Oct 2021 18:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D68AD1BF39D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C100840546
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 18:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2paZu6h54kt8 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 18:04:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5FD4040F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 18:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9337594832; Sat,  9 Oct 2021 18:01:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 19:19:22 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b86bef23bd853dda6f3c976b1bf4bfc872dfda98
X-Git-Newrev: 9d95cbae26979212903a5a5d1e1e12e480e8112f
X-Patchwork-Hint: ignore
Message-Id: <20211009180151.9337594832@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gst1-interpipe:
 bump version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d95cbae26979212903a5a5d1e1e12e480e8112f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog (for details see [1]):

  - Fix for memory corruption issue when listening to same node (#99)

[1] https://github.com/RidgeRun/gst-interpipe/releases/tag/1.1.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 49381c4f599d09430b51dbd39465a801c28ea5b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index a84be7a085..b3fc8ef018 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  4543b2872ee5985679375aa4e588b2dcf8b8c4f61f106655989c89f4aab0d736  gst1-interpipe-1.1.5-br1.tar.gz
+sha256  00d3a91625f6cc5d263f35b9330b4ba6eb40781be2e823231e5b2be9281e1fb4  gst1-interpipe-1.1.6-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 8d1da080a1..80e5b577f6 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.5
+GST1_INTERPIPE_VERSION = 1.1.6
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
