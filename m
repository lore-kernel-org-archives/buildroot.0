Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A241BE6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E168414F;
	Fri,  6 Sep 2024 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrgiUcR4OWXS; Fri,  6 Sep 2024 19:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A824384172
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A824384172;
	Fri,  6 Sep 2024 19:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA461BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65477817E4
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-gC5XTB9bty for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FDF081E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FDF081E4F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BE9F86EE3; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 23:58:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71ed598709a63d923483cb461da91f66942e0975
X-Git-Newrev: efb917a17e66b425e2a0c5a0387d4b6ab35fe71d
X-Patchwork-Hint: ignore
Message-Id: <20240906195852.8BE9F86EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/simple-mail: bump to 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=efb917a17e66b425e2a0c5a0387d4b6ab35fe71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/simple-mail/simple-mail.hash | 2 +-
 package/simple-mail/simple-mail.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
index 67d6caff87..4de1525b53 100644
--- a/package/simple-mail/simple-mail.hash
+++ b/package/simple-mail/simple-mail.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2026f2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410  simple-mail-2.3.0.tar.gz
+sha256  f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  simple-mail-3.0.0.tar.gz
 
 # Hash for license file
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 68484f79b0..94f2369816 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIMPLE_MAIL_VERSION = 2.3.0
+SIMPLE_MAIL_VERSION = 3.0.0
 SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
