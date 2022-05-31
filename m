Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75166C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396BA41BD2;
	Tue, 31 May 2022 08:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhdTnOR1RtH6; Tue, 31 May 2022 08:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A079E41A00;
	Tue, 31 May 2022 08:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A81311BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D63460FE9
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gtt0l-yHgcSB for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B652A60784
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A7FD086871; Tue, 31 May 2022 08:31:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63c5c26646ba31caef1a3f3bb16c49a11903e5a8
X-Git-Newrev: 4504ec7d4df07ee957bcd60f0e7958278499f5ed
X-Patchwork-Hint: ignore
Message-Id: <20220531083127.A7FD086871@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-lager: bump
 version to 3.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4504ec7d4df07ee957bcd60f0e7958278499f5ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-lager/erlang-lager.hash | 4 ++--
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 40291af392..282d112d3b 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5bb4ba6f918e90d2e6671c3996d72c61f2a589b65c151b3df8011d046362981 erlang-lager-3.6.10.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
+sha256  13316ba3006b174cf6b085ad13ed19ec0f618f10b83fc3530a072cdf4b50668b  erlang-lager-3.9.1.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index a698bce8d5..7ff27ec0f2 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.6.10
+ERLANG_LAGER_VERSION = 3.9.1
 ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
