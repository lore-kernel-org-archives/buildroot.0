Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFBECFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DBA61AD3;
	Thu, 27 Nov 2025 20:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXVwejvNL-NR; Thu, 27 Nov 2025 20:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCE961B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCE961B29;
	Thu, 27 Nov 2025 20:36:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 225EE967
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F8780699
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6dtfSTqC7BU for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02DF980708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02DF980708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0106E83F51; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:32:07 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 30c8bd4a51471b2bdbf4f2c4a75f730e8db2cab2
X-Git-Newrev: f797b2a7653ae6c4531e7d5d4138555d59f63a32
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.0106E83F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: remove Bernd
 Kuhls from libdecor & libfreeglut
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f797b2a7653ae6c4531e7d5d4138555d59f63a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5db55534af777fba6543aeb40f60e1080b2828a8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9ef7b2abe..873cf0c76b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -397,7 +397,6 @@ F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
-F:	package/libdecor/
 F:	package/libdeflate/
 F:	package/libdisplay-info/
 F:	package/libdrm/
@@ -405,7 +404,6 @@ F:	package/libdvbcsa/
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
