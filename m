Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EECC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E9E4F433;
	Tue, 21 Feb 2023 00:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E9E4F433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbA6OGb1tSG2; Tue, 21 Feb 2023 00:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0D54F496;
	Tue, 21 Feb 2023 00:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C0D54F496
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42FF31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 634ED41813
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 634ED41813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlqNuZBAPfn1 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3CAE4180E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CAE4180E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FAFB8648F; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 09:28:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5be2d9bb621e3f3aa552516c8887a7821ed62788
X-Git-Newrev: d758b054b496619999e03c60c63b6636d818f3e5
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.8FAFB8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/re2: bump to version
 2023-02-01
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

commit: https://git.buildroot.net/buildroot/commit/?id=d758b054b496619999e03c60c63b6636d818f3e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index 9019867db4..a39dece7a9 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  665b65b6668156db2b46dddd33405cd422bd611352c5052ab3dae6a5fbac5506  re2-2022-12-01.tar.gz
+sha256  cbce8b7803e856827201a132862e41af386e7afd9cc6d9a9bc7a4fa4d8ddbdde  re2-2023-02-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 07bb9378de..5587366b1f 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2022-12-01
+RE2_VERSION = 2023-02-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
