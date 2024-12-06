Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6947AE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3561460618;
	Fri,  6 Dec 2024 19:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsqojwXwuUTl; Fri,  6 Dec 2024 19:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42BCE611CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42BCE611CD;
	Fri,  6 Dec 2024 19:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8417ED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B904D60618
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVHk-ofMqwz3 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A29605A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A29605A5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:55:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA6D686A8D; Fri,  6 Dec 2024 19:55:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 20:51:18 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 598f53731639dc96fa1fd8fb520e6af37e34f33c
X-Git-Newrev: 7bd02e75ae32b44079c447a4e50e497a001f3694
X-Patchwork-Hint: ignore
Message-Id: <20241206195529.EA6D686A8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop Yann's
 entries
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7bd02e75ae32b44079c447a4e50e497a001f3694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

As it happens, I am unable to keep maintaining those entries, and it is
misleading to others about whether they should Cc me on their changes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 773a89d41465387791350d31f51a602322734aeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 49 -------------------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c352a348b2..b769c1d2bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3170,55 +3170,6 @@ F:	package/casync/
 F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
-N:	Yann E. MORIN <yann.morin.1998@free.fr>
-F:	fs/squashfs/
-F:	package/asterisk/
-F:	package/cegui/
-F:	package/dahdi-linux/
-F:	package/dahdi-tools/
-F:	package/dbus-broker/
-F:	package/dtc/
-F:	package/dtv-scan-tables/
-F:	package/dvb-apps/
-F:	package/freerdp/
-F:	package/keyutils/
-F:	package/libbsd/
-F:	package/libedit/
-F:	package/libgsm/
-F:	package/libiberty/
-F:	package/libinput/
-F:	package/libiscsi/
-F:	package/libpri/
-F:	package/libseccomp/
-F:	package/libss7/
-F:	package/linux-firmware/
-F:	package/linux-tools/
-F:	package/matchbox*
-F:	package/mesa3d-headers/
-F:	package/nbd/
-F:	package/nut/
-F:	package/nvidia-driver/
-F:	package/omxplayer/
-F:	package/python-pyparsing/
-F:	package/pkg-download.mk
-F:	package/pkg-waf.mk
-F:	package/slirp/
-F:	package/snappy/
-F:	package/spice/
-F:	package/spice-protocol/
-F:	package/systemd/
-F:	package/systemd-bootchart/
-F:	package/tmux/
-F:	package/tvheadend/
-F:	package/usbredir/
-F:	package/vde2/
-F:	package/w_scan/
-F:	package/wayland/
-F:	package/weston/
-F:	package/wtfutil/
-F:	package/zisofs-tools/
-F:	support/download/
-
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
