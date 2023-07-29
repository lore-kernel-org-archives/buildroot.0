Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5754B818C0;
	Sat, 29 Jul 2023 08:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5754B818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paqmCZGhaiwt; Sat, 29 Jul 2023 08:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBF481826;
	Sat, 29 Jul 2023 08:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBF481826
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA151BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1215E8179A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1215E8179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D28C1r5g-bZ6 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 298718169A
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298718169A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1556683668; Sat, 29 Jul 2023 08:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 10:55:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be57403d04c20e5c870b9fff0e650587de493739
X-Git-Newrev: f8147e27cdac8f998ec6644a09ce4e8d62b6433c
X-Patchwork-Hint: ignore
Message-Id: <20230729085842.1556683668@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: bump to version 1.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8147e27cdac8f998ec6644a09ce4e8d62b6433c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-pam/linux-pam.hash | 4 ++--
 package/linux-pam/linux-pam.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index 0be3433687..97acbd7adc 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.5.2/Linux-PAM-1.5.2.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d  Linux-PAM-1.5.2.tar.xz
+sha256  7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283  Linux-PAM-1.5.3.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 789dcf5c7b..21e5decb9c 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.5.2
+LINUX_PAM_VERSION = 1.5.3
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
