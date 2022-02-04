Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9694DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432B94094C;
	Fri,  4 Feb 2022 22:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8XhsfmvNmBy; Fri,  4 Feb 2022 22:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B56B4097E;
	Fri,  4 Feb 2022 22:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75E701BF4E6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6443081BD9
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPGvS0bS4bto for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78FDB827B5
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BE32E819CD; Fri,  4 Feb 2022 21:58:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Feb 2022 23:05:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f54f61eb3a8c09e46137712796c2b93f4760a6d4
X-Git-Newrev: b4ddaeb080ec00891ec415d373236582d28e9c17
X-Patchwork-Hint: ignore
Message-Id: <20220204215815.BE32E819CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat: bump to version 0.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4ddaeb080ec00891ec415d373236582d28e9c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index aa6c8d743d..f4d3e32c34 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  9c345788eb916777a60e7ff32031f1c92edc5565031e0c057bce860982768744  bat-0.18.3.tar.gz
+sha256  7940641baaa61cd3bcd1c3db4804d179609d6ccd955868928a129bf3f853e0b2  bat-0.19.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 9b619af172..dc29a85429 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.18.3
+BAT_VERSION = 0.19.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
