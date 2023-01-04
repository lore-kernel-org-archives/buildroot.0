Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320BBC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D443341496;
	Tue, 21 Feb 2023 00:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D443341496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZN0isakYVqXo; Tue, 21 Feb 2023 00:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0B34F011;
	Tue, 21 Feb 2023 00:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0B34F011
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9A81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F16376FAA0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F16376FAA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnuuCxVjUvtp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30225617B1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30225617B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D229828C8; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:51:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5424bd0a827ef2a36707b5c12a11251169622160
X-Git-Newrev: 4432cf65ee7ec0fe9cc23bcac251adca16aeb014
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.2D229828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/re2: bump to version
 2022-12-01
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

commit: https://git.buildroot.net/buildroot/commit/?id=4432cf65ee7ec0fe9cc23bcac251adca16aeb014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index 380b547658..9019867db4 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  f89c61410a072e5cbcf8c27e3a778da7d6fd2f2b5b1445cd4f4508bee946ab0f  re2-2022-06-01.tar.gz
+sha256  665b65b6668156db2b46dddd33405cd422bd611352c5052ab3dae6a5fbac5506  re2-2022-12-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 39b2c8d990..07bb9378de 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2022-06-01
+RE2_VERSION = 2022-12-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
