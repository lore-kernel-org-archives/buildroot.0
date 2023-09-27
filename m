Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57204E82CA1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A09A741B54;
	Wed, 27 Sep 2023 17:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A09A741B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97goZu_k6Fdu; Wed, 27 Sep 2023 17:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E691041B4B;
	Wed, 27 Sep 2023 17:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E691041B4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 573F41BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 312BA6157E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 312BA6157E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsU9mCUm3a9a for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624CF61145
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624CF61145
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F7D38253F; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 19:46:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c76f5f24c7b06e276a471aa618d4b5c2f7f7975a
X-Git-Newrev: 35dcf9ee56695023ace9b2505fa169d262f8ff38
X-Patchwork-Hint: ignore
Message-Id: <20230927175642.4F7D38253F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nanomsg: bump to version 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=35dcf9ee56695023ace9b2505fa169d262f8ff38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nanomsg/nanomsg/releases/tag/1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nanomsg/nanomsg.hash | 2 +-
 package/nanomsg/nanomsg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index 04b658e8d8..abf117a572 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
+sha256  6ef7282e833df6a364f3617692ef21e59d5c4878acea4f2d7d36e21c8858de67  nanomsg-1.2.tar.gz
 
 # Hash for license file:
 sha256  4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
index b86e8c128a..e5c576ef2c 100644
--- a/package/nanomsg/nanomsg.mk
+++ b/package/nanomsg/nanomsg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANOMSG_VERSION = 1.1.5
+NANOMSG_VERSION = 1.2
 NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
 NANOMSG_INSTALL_STAGING = YES
 NANOMSG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
