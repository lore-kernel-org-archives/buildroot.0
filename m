Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E0D767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884FD403BD;
	Thu, 31 Oct 2024 18:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GE-HyOeIUpLA; Thu, 31 Oct 2024 18:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67728403C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67728403C9;
	Thu, 31 Oct 2024 18:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 261DC5E53
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BE360AEB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIrsjs1KUNnJ for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4660360AE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4660360AE6
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33306851A2; Thu, 31 Oct 2024 18:08:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 19:08:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6820fa3ef794ecb80cf3ca14a551539e16dcf563
X-Git-Newrev: 964102392b5babc10f2d344be07fd606ca76c0b7
X-Patchwork-Hint: ignore
Message-Id: <20241031180841.33306851A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtc-tools: bump to version 2022.02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=964102392b5babc10f2d344be07fd606ca76c0b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtc-tools/rtc-tools.hash | 2 +-
 package/rtc-tools/rtc-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index a3f3bdcc11..edf65bf968 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  68b6820aeb8132b3f034fb79cf761c4549373d67641afb05b58641f1d32bb69f  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-git4.tar.gz
+sha256  bc5f025b9d326513f8f0cf3c5afee7d18fa0898b53312881a20f7c099b83f5ae  rtc-tools-2022.02-git4.tar.gz
 sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
index 2882c88575..546c3cd9ea 100644
--- a/package/rtc-tools/rtc-tools.mk
+++ b/package/rtc-tools/rtc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
+RTC_TOOLS_VERSION = 2022.02
 RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
 RTC_TOOLS_SITE_METHOD = git
 RTC_TOOLS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
