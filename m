Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7809ECFB442
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477B880A55;
	Mon,  7 Oct 2024 06:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2S68Z9WSS8e; Mon,  7 Oct 2024 06:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55ADE8089A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ADE8089A;
	Mon,  7 Oct 2024 06:06:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 518AF1BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D73360609
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8Mb8Ou_HdFx for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4C5605DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B4C5605DB
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B12785730; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 07:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae7fa9c0052c66f618f304e1101b29de843151c2
X-Git-Newrev: d21566cbfc0d51c22cdd210ffc97eee87a52d3cb
X-Patchwork-Hint: ignore
Message-Id: <20241007060625.2B12785730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: bump version to 9.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d21566cbfc0d51c22cdd210ffc97eee87a52d3cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since version 9.2.6, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.6&to=9.2.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 98611ffcda..36e27cef2d 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  0cb9b80b9922be8165cbac384ebe050d94553e72cf7aebfc980b4395ff01d05d  swipl-9.2.6.tar.gz
+sha256  fd4126f047e0784112741a874e2f7f8c68b5edd6426ded621df355c62d18c96f  swipl-9.2.7.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index 595f5e975b..ba33b1b1c3 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.6
+SWIPL_VERSION = 9.2.7
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
