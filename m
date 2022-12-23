Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2634C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450524F1FA;
	Mon, 20 Feb 2023 22:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450524F1FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2HQZG60s1JV; Mon, 20 Feb 2023 22:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C49F4F1E5;
	Mon, 20 Feb 2023 22:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C49F4F1E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48D281BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA3A3416FB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3A3416FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20EdZM3TQ8jJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0459C416DF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0459C416DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00CF286494; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:57:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8036b087489c96dfc4a0baf9fbe284a049a58298
X-Git-Newrev: 8024bae870b7ebd9707614343c5dfdc849ea8fdd
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.00CF286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bird: bump to version
 2.0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=8024bae870b7ebd9707614343c5dfdc849ea8fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://bird.network.cz/pipermail/bird-users/2022-December/016431.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 6ccacd8d58..3e00a1993d 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a  bird-2.0.10.tar.gz
+sha256  60a7b83b67b9d089d2a745a11fddd12461f631abc7b645b6c085adf90b3f55d6  bird-2.0.11.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index e1e392168c..1295358fb9 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.10
+BIRD_VERSION = 2.0.11
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
