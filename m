Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E04C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0F5E404EF;
	Sat, 29 Oct 2022 16:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0F5E404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VsnISqednXc; Sat, 29 Oct 2022 16:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B91404EC;
	Sat, 29 Oct 2022 16:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B91404EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD36A1BF955
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A50F6407D7
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50F6407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVu-ogf2V-Cw for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9675540761
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9675540761
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8164B8742F; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:20:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 376203a34e9851acaef1fcdff38aae1df89d50f9
X-Git-Newrev: 4a65c3d9cdf84b47f5e25ba9dc0f759e4f96c557
X-Patchwork-Hint: ignore
Message-Id: <20221029162315.8164B8742F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a65c3d9cdf84b47f5e25ba9dc0f759e4f96c557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=c080b34e57d01a6ccca9d2996d7096c42b1a3f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index e5f3d90652..187c86f9bd 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b8b88cab4fd844e3616d55aeba8f084f2b98fb0f  pinentry-1.1.1.tar.bz2
+sha1  29daaf45f15cb5b8ec9b4a06284343f7a87082fb  pinentry-1.2.1.tar.bz2
 # Locally computed
-sha256  cd12a064013ed18e2ee8475e669b9f58db1b225a0144debdb85a68cecddba57f  pinentry-1.1.1.tar.bz2
+sha256  457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067  pinentry-1.2.1.tar.bz2
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 8ebd35cfab..338d61af2d 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.1.1
+PINENTRY_VERSION = 1.2.1
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
