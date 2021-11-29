Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C70C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3470405AE;
	Mon, 29 Nov 2021 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BP1VEFJh4bGv; Mon, 29 Nov 2021 21:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3796D405C0;
	Mon, 29 Nov 2021 21:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 716E71BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE47F8187F
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTYgwTHeATgH for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E919281A27
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 664B390881; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:34:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdef53d4203aab3cb026d26aa83545c06fc18d27
X-Git-Newrev: 3365a5680d22e0e9df92548c0c93c952a2e0ac40
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.664B390881@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: drop spurious
 space
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

commit: https://git.buildroot.net/buildroot/commit/?id=3365a5680d22e0e9df92548c0c93c952a2e0ac40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
beb24ce2b0abea2ac68bd86a0ac2162d98bda6cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index eb75d23f44..7084ab781e 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -22,7 +22,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
 
 	# Remove any existing certificates under /etc/ssl/certs
-	rm -f  $(TARGET_DIR)/etc/ssl/certs/*
+	rm -f $(TARGET_DIR)/etc/ssl/certs/*
 
 	# Create symlinks to certificates under /etc/ssl/certs
 	# and generate the bundle
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
