Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A9C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F55C60BDD;
	Mon,  5 Feb 2024 13:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F55C60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI7VoLPNNqUz; Mon,  5 Feb 2024 13:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E2761042;
	Mon,  5 Feb 2024 13:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E2761042
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 331861BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FBF60E43
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9FBF60E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBnnVhPG9OBL for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F3E760F1A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F3E760F1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F17086C7B; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2af4afbda22b974b8c75abb6ba96b2e3e122e972
X-Git-Newrev: dc14e44e63ce84daa338dd85b727b1b263931e0b
X-Patchwork-Hint: ignore
Message-Id: <20240205132915.2F17086C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: bump version to 2.30.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc14e44e63ce84daa338dd85b727b1b263931e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/s390-tools/s390-tools.hash | 2 +-
 package/s390-tools/s390-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index a00e95437b..c70bf69f00 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  849ff400dc6c1eb7eebe4aa3e7a4871721c25bcee6cfdd0535a056a038fd3ab0  s390-tools-2.29.0.tar.gz
+sha256  9e565701cc6df4808243027706ee0a76c5fc0c7f9aae0afce1479fd4ff68bcdf  s390-tools-2.30.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index c3155a13ff..bc39a9bd19 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.29.0
+S390_TOOLS_VERSION = 2.30.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
