Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB08C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5068960EFD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5068960EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E2640505;
	Wed,  4 Aug 2021 21:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSMg5C9-EyxX; Wed,  4 Aug 2021 21:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D8F403B3;
	Wed,  4 Aug 2021 21:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCEC1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B73583576
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQvKyKJ9IYva for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558E583366
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3F7B98B7C5; Wed,  4 Aug 2021 21:26:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:23:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b5dc4e32ed1d1f125b64c6cdaf81db4f320400f
X-Git-Newrev: a24bc1d9b8cf5bd3304452ab37e13769ef1bc6b4
X-Patchwork-Hint: ignore
Message-Id: <20210804212635.3F7B98B7C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
 3.3.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a24bc1d9b8cf5bd3304452ab37e13769ef1bc6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 3.3.8 brings many bug fixes and enhancements and is recommended
for all users.

https://github.com/mikebrady/shairport-sync/releases/tag/3.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index c451edb933..ebc81dedc1 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f8d4ecec53f2f681a962467bf09205568fc936c8c31a9ee07b1bd72d3d95b12  shairport-sync-3.3.7.tar.gz
+sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 1a02186dc1..adc584d554 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.7
+SHAIRPORT_SYNC_VERSION = 3.3.8
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
