Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA39CF58E5
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 07:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF3C400F1;
	Fri, 20 Sep 2024 07:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJjBESGcTw1V; Fri, 20 Sep 2024 07:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DD04010F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DD04010F;
	Fri, 20 Sep 2024 07:52:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8332A1BF82C
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 723154010F
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq6Fj8amXqn2 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 07:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7CF400F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E7CF400F1
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 07:52:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ACC683CC1; Fri, 20 Sep 2024 07:52:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 09:42:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6d9ecca957d23d3b408a65cd1e31147f8a5a7bf7
X-Git-Newrev: 041393b237d7c9b02d50abe840109ff56c25513f
X-Patchwork-Hint: ignore
Message-Id: <20240920075216.6ACC683CC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop Samuel
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

commit: https://git.buildroot.net/buildroot/commit/?id=041393b237d7c9b02d50abe840109ff56c25513f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index d106f532e0..2a7509f111 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2764,20 +2764,6 @@ F:	package/procs/
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
