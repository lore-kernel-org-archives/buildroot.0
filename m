Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3BFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3887F41BE2;
	Tue, 31 May 2022 08:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bf1vxhHXtdgu; Tue, 31 May 2022 08:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF60041988;
	Tue, 31 May 2022 08:46:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36CA91BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3240140C99
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrzBk7EGRk4T for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5530C40CCD
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A41686871; Tue, 31 May 2022 08:31:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 117f85da8aaac1cea2c867036cf40fde32b3502c
X-Git-Newrev: 6d296aa2da87ab0071d68c6ad9f81d084a4ad7dc
X-Patchwork-Hint: ignore
Message-Id: <20220531083128.5A41686871@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-sip: bump
 version to 1.0.47
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d296aa2da87ab0071d68c6ad9f81d084a4ad7dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The copyright year in the license file has been updated to 2022, hence
the new license hash.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 4 ++--
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index e52371e404..b20df00280 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46349a7077d8e5f36a216ada4a5c0b51ef3d66005606beb0ea3962069f215a7  erlang-p1-sip-1.0.38.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  1de406bc59c30e2697b8b29cc0ad0e370e6f5a5d777d37e022d195586b80643d  erlang-p1-sip-1.0.47.tar.gz
+sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 2d2f0110c3..f0e999ec54 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.38
+ERLANG_P1_SIP_VERSION = 1.0.47
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
