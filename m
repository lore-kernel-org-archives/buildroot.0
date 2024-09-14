Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9073C02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F608404F9;
	Sat, 14 Sep 2024 12:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzR3l7zNv_-V; Sat, 14 Sep 2024 12:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEECB40523
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEECB40523;
	Sat, 14 Sep 2024 12:46:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38A4E1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2787660769
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3PkPh1nU55X for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462CB606E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 462CB606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:46:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B4B5828B9; Sat, 14 Sep 2024 12:46:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:45:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a9d61fec10a1386da9769668ae64d98c08add88
X-Git-Newrev: d8b83b861c5f503481c47c4fc9335dc3e87b027a
X-Patchwork-Hint: ignore
Message-Id: <20240914124623.3B4B5828B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Samuel Martin
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8b83b861c5f503481c47c4fc9335dc3e87b027a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Samuel Martin has not been around in the Buildroot community for many,
many years. His last posting on the mailing list was on July 2018. So
let's not pretend those packages are actually maintained, and let's
stop spamming Samuel with lots of patches and autobuilder failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index cbc2040165..3998a01991 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2899,20 +2899,6 @@ F:	package/zoxide/
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
