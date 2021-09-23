Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60246C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1219F60EB2
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1219F60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8760406EB;
	Thu, 23 Sep 2021 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91Pq_X6hEGHz; Thu, 23 Sep 2021 21:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283BD40767;
	Thu, 23 Sep 2021 21:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A89BD1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98BB060B25
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcxPzAD5yf7I for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8F96064B
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B0798D211; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3712a86adca8f512b0e7c45c9196732841af10c
X-Git-Newrev: 5cae1a0d675eca41125b6430157d3d0d78d1220c
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.5B0798D211@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavemon: bump to version 0.9.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cae1a0d675eca41125b6430157d3d0d78d1220c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new LICENSE file added in version 0.9.3 with
https://github.com/uoaerg/wavemon/commit/2251870415c5be3850ce59d99d0e352e55a3280a
as COPYING has been dropped with
https://github.com/uoaerg/wavemon/commit/bfa12c46c773e5fe49ec4f91fc6260aa4f66e258
The text has been updated with https URLs.

https://github.com/uoaerg/wavemon/releases/tag/v0.9.2
https://github.com/uoaerg/wavemon/releases/tag/v0.9.3
https://github.com/uoaerg/wavemon/releases/tag/v0.9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wavemon/wavemon.hash | 4 ++--
 package/wavemon/wavemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 455e64cba8..7c685f6500 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ebd5b79d3b7c546bc16b95161872c699a75e9acdfc6e3f02ec48dad10802067  wavemon-0.9.1.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e7e4167292136ca7ff12ddeb880904c10f33e97620ea6aa5f7838e859fdb40ed  wavemon-0.9.4.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index d2af6c2bc0..50e3fd275e 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.1
+WAVEMON_VERSION = 0.9.4
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
-WAVEMON_LICENSE_FILES = COPYING
+WAVEMON_LICENSE_FILES = LICENSE
 WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 
 # Handwritten Makefile.in, automake isn't used
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
