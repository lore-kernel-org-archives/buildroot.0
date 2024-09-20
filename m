Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407DFCF58E4
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 07:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2AB412AD;
	Fri, 20 Sep 2024 07:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzTD7WVElxm5; Fri, 20 Sep 2024 07:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C620414F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C620414F6;
	Fri, 20 Sep 2024 07:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEFD51BF82C
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48DEE84BDA
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6CsY9k93C5u for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1C084BDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B1C084BDC
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 687AA83E6F; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 09:42:32 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 7e31c9deac00f59d99aa545f5939bba73a0020ca
X-Git-Newrev: 5db78454b230652164db6e2a5eef91f65f891b5e
X-Patchwork-Hint: ignore
Message-Id: <20240920075330.687AA83E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] DEVELOPERS: drop Samuel
 Martin
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

commit: https://git.buildroot.net/buildroot/commit/?id=5db78454b230652164db6e2a5eef91f65f891b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Samuel Martin has not been around in the Buildroot community for many,
many years. His last posting on the mailing list was on July 2018. So
let's not pretend those packages are actually maintained, and let's
stop spamming Samuel with lots of patches and autobuilder failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8b83b861c5f503481c47c4fc9335dc3e87b027a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 069965680b..d954fdc7ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2876,20 +2876,6 @@ F:	package/zoxide/
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
-N:	Samuel Martin <s.martin49@gmail.com>
-F:	package/armadillo/
-F:	package/cwiid/
-F:	package/flite/
-F:	package/nginx/
-F:	package/opencv3/
-F:	package/openobex/
-F:	package/pkg-cmake.mk
-F:	package/python-numpy/
-F:	package/scrub/
-F:	package/urg/
-F:	package/ussp-push/
-F:	support/misc/toolchainfile.cmake.in
-
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
