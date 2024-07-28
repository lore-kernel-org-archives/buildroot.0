Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB7C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 452CB401AD;
	Sun, 28 Jul 2024 19:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icApcG1EYqaB; Sun, 28 Jul 2024 19:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E688403BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E688403BF;
	Sun, 28 Jul 2024 19:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C66601BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C155D402F0
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsoknNsMLKIY for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC25B402BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC25B402BF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:56:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B738285F; Sun, 28 Jul 2024 19:56:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 21:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89bf25673a760023ba4a9b5a683d19bbc83ef7b0
X-Git-Newrev: c79ec67bc8763f8d630f51ffbcaf0bb6bfb71236
X-Patchwork-Hint: ignore
Message-Id: <20240728195631.D5B738285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bernd Kuhls from libks
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

commit: https://git.buildroot.net/buildroot/commit/?id=c79ec67bc8763f8d630f51ffbcaf0bb6bfb71236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c6b0d68bcb..78ea65205d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -430,7 +430,6 @@ F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
 F:	package/libilbc/
-F:	package/libks/
 F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
