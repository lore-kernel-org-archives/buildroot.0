Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD74CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B37412FD;
	Mon, 17 Nov 2025 22:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg9x93gEsjMO; Mon, 17 Nov 2025 22:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D7F6412E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7F6412E7;
	Mon, 17 Nov 2025 22:19:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D7AD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 487E5412E7
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw96yS00e6Dj for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A641840D1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A641840D1A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9642084D6A; Mon, 17 Nov 2025 22:19:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 23:18:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1f5023bd9f87731287ca92cd9cea5558a7a043b
X-Git-Newrev: 5db55534af777fba6543aeb40f60e1080b2828a8
X-Patchwork-Hint: ignore
Message-Id: <20251117221906.9642084D6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bernd Kuhls from
 libdecor & libfreeglut
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5db55534af777fba6543aeb40f60e1080b2828a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5ad36181c..5458dbd590 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -407,7 +407,6 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
-F:	package/libdecor/
 F:	package/libdeflate/
 F:	package/libdisplay-info/
 F:	package/libdrm/
@@ -415,7 +414,6 @@ F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
-F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
