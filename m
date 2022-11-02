Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D548AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5547F416DC;
	Wed,  2 Nov 2022 17:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5547F416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SV0GwR5Dl5bD; Wed,  2 Nov 2022 17:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E124019D;
	Wed,  2 Nov 2022 17:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E124019D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58E3B1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41BC0408CD
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41BC0408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtKqobMVnscR for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:08:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9247740329
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9247740329
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EC3287A57; Wed,  2 Nov 2022 17:08:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 18:08:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f66221589fe9a2107f1ef4709875bb8efdb41d2a
X-Git-Newrev: 5bec3b67f4dcb7297ec2da955ee3bebe7f3137a7
X-Patchwork-Hint: ignore
Message-Id: <20221102170844.7EC3287A57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Emile Cormier
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bec3b67f4dcb7297ec2da955ee3bebe7f3137a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a private e-mail, Emile said "Hi Thomas. Please remove me from the
DEVELOPERS file. I am no longer interested in the packages under my
name."

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1e919ce4f..7d27936992 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -789,10 +789,6 @@ N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
-N:	Emile Cormier <emile.cormier.jr@gmail.com>
-F:	package/python-appdirs/
-F:	package/python-zlmdb/
-
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
