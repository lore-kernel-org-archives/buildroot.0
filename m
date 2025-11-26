Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77831D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAA661BA3;
	Thu, 27 Nov 2025 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_4vSGw9aK3Y; Thu, 27 Nov 2025 20:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E70261B96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E70261B96;
	Thu, 27 Nov 2025 20:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B01DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADBA7843D2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ML7bjtH3Fj-f for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD81D843C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD81D843C6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBBDA8355B; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:25:44 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 787510d99f6a1468ac02c0e552d080808590e1de
X-Git-Newrev: 939e6ea14853b9ced9c3d0157047ce3aa0d99c5d
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.BBBDA8355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: update Zoltan
 Gyarmati e-mail address
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

commit: https://git.buildroot.net/buildroot/commit/?id=939e6ea14853b9ced9c3d0157047ce3aa0d99c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Julien: reword commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 75dc8e1842143f347bd7395ecedad4308bc14953)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index cc77eba251..d9ef7b2abe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3514,7 +3514,7 @@ F:	utils/scanpypi
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
 F:	package/libopenaptx/
 
-N:	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
+N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 F:	package/crudini/
 F:	package/grantlee/
 F:	package/libusb/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
