Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 19:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 631924038D;
	Sat, 26 Mar 2022 19:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_CSRaS-R9xg; Sat, 26 Mar 2022 19:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 500574015A;
	Sat, 26 Mar 2022 19:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2723F1BF59B
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C3760767
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 19:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_4T46vgTo4l for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 19:29:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72877605B0
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 19:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0495B848DA; Sat, 26 Mar 2022 19:20:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Mar 2022 20:25:24 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 44edd4bd14c54b401c27976406ab24062c353cbc
X-Git-Newrev: 2366533fd1be0bea767ef68fe2d8d45e676a4f5f
X-Patchwork-Hint: ignore
Message-Id: <20220326192052.0495B848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: update email
 address
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

commit: https://git.buildroot.net/buildroot/commit/?id=2366533fd1be0bea767ef68fe2d8d45e676a4f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This patch updates my email address in the DEVELOPERS file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ae1deebb9e78b5338f5f30fe4765e3eb9e5be3d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5183711b5..c3d7c4a6fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2082,7 +2082,7 @@ F:	package/libevdev/
 F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
-N:	Neal Frager <neal.frager@xilinx.com>
+N:	Neal Frager <neal.frager@amd.com>
 F:	board/zynqmp/
 F:	configs/zynqmp_zcu102_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
