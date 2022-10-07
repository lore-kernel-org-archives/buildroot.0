Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5720AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0124C83EF9;
	Fri,  7 Oct 2022 15:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0124C83EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyRopSzOa4g8; Fri,  7 Oct 2022 15:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE63583EF6;
	Fri,  7 Oct 2022 15:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE63583EF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 426D81BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2708441C74
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2708441C74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziJts4akFBvZ for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1127141D10
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1127141D10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F381786B91; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Oct 2022 17:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82c6e87d5eaaf5b32aa340ab384f88539238cbe1
X-Git-Newrev: 4f00b909b9ee637c255a882fdda580fb1a66a014
X-Patchwork-Hint: ignore
Message-Id: <20221007154207.F381786B91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ocf-linux: bump to version 20171122
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f00b909b9ee637c255a882fdda580fb1a66a014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ocf-linux/ocf-linux.hash | 2 +-
 package/ocf-linux/ocf-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ocf-linux/ocf-linux.hash b/package/ocf-linux/ocf-linux.hash
index 0bd0ea19df..747bbcab56 100644
--- a/package/ocf-linux/ocf-linux.hash
+++ b/package/ocf-linux/ocf-linux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5113609d2c2c43fde962bec1238fe5a81211a751ebb0337b54a9804d40cfef53  ocf-linux-20120127.tar.gz
+sha256  3d7984754d58ced5695889744caf1e18a53f5d2e35ed40cc04d3595e59b7431f  ocf-linux-20171122.tar.gz
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 01854fa73a..52169eda4f 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCF_LINUX_VERSION = 20120127
+OCF_LINUX_VERSION = 20171122
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
 OCF_LINUX_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
