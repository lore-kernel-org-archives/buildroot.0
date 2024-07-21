Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C35DC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE6F060635;
	Sun, 21 Jul 2024 16:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MRpT_Vnhvm1; Sun, 21 Jul 2024 16:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F88606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F88606B4;
	Sun, 21 Jul 2024 16:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A10C91BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EAFB4039F
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jD7s1zsi5PYd for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35764038F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35764038F
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B7A486EE5; Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:17:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acdcc4c98ad7b04fa1def79c3e8b42dbb866b91b
X-Git-Newrev: ade6e41831c2b1f82028dda9744c6b64907e20ef
X-Patchwork-Hint: ignore
Message-Id: <20240721161910.8B7A486EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: change URL to HTTPS
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
Content-Type: multipart/mixed; boundary="===============4495543831439069799=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4495543831439069799==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ade6e41831c2b1f82028dda9744c6b64907e20ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/micropython/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 849a5452f4..b466fbaf2d 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_MICROPYTHON
 	  3 programming language that is optimised to run on a
 	  microcontroller.
 
-	  http://micropython.org
+	  https://micropython.org
 
 if BR2_PACKAGE_MICROPYTHON
 

--===============4495543831439069799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4495543831439069799==--
