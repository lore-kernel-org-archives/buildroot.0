Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A7CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E8743372;
	Thu, 19 Sep 2024 09:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CynXZ3Dycg-3; Thu, 19 Sep 2024 09:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC3A41749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AC3A41749;
	Thu, 19 Sep 2024 09:18:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A730D1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4491F84996
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4wbvETUMUqK for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 849C9849F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 849C9849F0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80CF883C66; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 25dc8e2d6f725070cdaf812cd58b9e8c4bfaddfd
X-Git-Newrev: 05fa1c65450fae4dd0ed04a34a7bdaae7da83be7
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.80CF883C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/flutter-pi: fix
 Raspberry typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=05fa1c65450fae4dd0ed04a34a7bdaae7da83be7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a0c020317dc591edb3582543606b638157dc918d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-pi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 223e29749c..ec2ef70737 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -24,7 +24,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PI
 	  Desktop & have X11 or Wayland load up; just boot into the
 	  command-line.
 
-	  Although flutter-pi is only tested on a Rasberry Pi 4
+	  Although flutter-pi is only tested on a Raspberry Pi 4
 	  2GB, it should work fine on other linux platforms supported
 	  by Flutter so long as there is support for KMS and DRI.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
