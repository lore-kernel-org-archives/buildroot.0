Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688DCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077EC41BF9;
	Tue, 31 May 2022 08:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6zap-PzgQWt; Tue, 31 May 2022 08:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1AE441BD5;
	Tue, 31 May 2022 08:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9723F1BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8083860FCB
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGnCY9Xola2d for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF2A760C20
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B1E3D86872; Tue, 31 May 2022 08:31:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4504ec7d4df07ee957bcd60f0e7958278499f5ed
X-Git-Newrev: 820bd7dee55686244b0ef6f88322b84c698d3716
X-Patchwork-Hint: ignore
Message-Id: <20220531083127.B1E3D86872@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-utils: bump
 version to 1.0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=820bd7dee55686244b0ef6f88322b84c698d3716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index dec7c26039..082622098e 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  234b88227f61ef03a6177d97ed062c62a22760b6fd189a5a24d2fd1599d95ac9  erlang-p1-utils-1.0.20.tar.gz
+sha256  05f29bc55a51840c84f4055b89d4cc312078badc5571a5962f15348fa5d87015  erlang-p1-utils-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 084382cd2b..5804c2531d 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.20
+ERLANG_P1_UTILS_VERSION = 1.0.23
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
