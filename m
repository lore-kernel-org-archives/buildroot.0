Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396A8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0FDD403A4;
	Sun, 11 Feb 2024 15:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5_SIHyIcdcY; Sun, 11 Feb 2024 15:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA844052F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA844052F;
	Sun, 11 Feb 2024 15:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71ABD1BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D3F682141
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYECziFBt_U8 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F8382142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F8382142
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:28:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F7568757E; Sun, 11 Feb 2024 15:28:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:11:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79f38212c5fc95f64fc59c96b651024dc39cc0ae
X-Git-Newrev: ebeb4f435303bf6802b647ac83373d5ed9980de5
X-Patchwork-Hint: ignore
Message-Id: <20240211152805.6F7568757E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump to version 6.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebeb4f435303bf6802b647ac83373d5ed9980de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Updated hash of COPYING (year updated with
  https://github.com/strace/strace/commit/eba0ac1fc4f8896b938d41081e0643cb06283a9b)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 75a35d7cf4..a35d2b0be6 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.6/strace-6.6.tar.xz.asc
-sha256  421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c  strace-6.6.tar.xz
-sha256  6e5648c0ed522b163f9df1dc500c73491b1743495bd78388e99685cecfa79707  COPYING
+# https://strace.io/files/6.7/strace-6.7.tar.xz.asc
+sha256  2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7  strace-6.7.tar.xz
+sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6279622fdb..f916936207 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.6
+STRACE_VERSION = 6.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
