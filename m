Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7544BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262B9417CF;
	Tue,  7 Feb 2023 13:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262B9417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCmpwRiMPZOw; Tue,  7 Feb 2023 13:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D55341770;
	Tue,  7 Feb 2023 13:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D55341770
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF5121BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95D9813C6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B95D9813C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqZW9n8hGG8n for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8121A8138C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8121A8138C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E95E84194; Tue,  7 Feb 2023 13:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:44:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33bdf7bb037c05863aa69bbe219e1cb78d596a3a
X-Git-Newrev: e06975b38047fe1ef47650248f154ecf88fe09b5
X-Patchwork-Hint: ignore
Message-Id: <20230207134415.6E95E84194@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: update URL in
 Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=e06975b38047fe1ef47650248f154ecf88fe09b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.asterisk.org/downloads/dahdi no longer works, use the
Github page instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dahdi-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
index 7b6ce79422..b6086fdc6c 100644
--- a/package/dahdi-linux/Config.in
+++ b/package/dahdi-linux/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_DAHDI_LINUX
 	  DAHDI Linux is the open source device driver framework used to
 	  interface Asterisk with telephony hardware.
 
-	  http://www.asterisk.org/downloads/dahdi
+	  https://github.com/asterisk/dahdi-linux
 
 comment "dahdi-linux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
