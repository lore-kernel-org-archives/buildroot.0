Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A1B4144E;
	Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ov8QhRae01-e; Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8911417FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8911417FF;
	Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 202C694F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192DF8030C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiXvo2oIcShv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F49380A6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F49380A6F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C87187A71; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Dec 2024 21:17:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0fd5860280c2172da28aec50dfd29b7a080f6c6c
X-Git-Newrev: 773a89d41465387791350d31f51a602322734aeb
X-Patchwork-Hint: ignore
Message-Id: <20250228162931.4C87187A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Yann's entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=773a89d41465387791350d31f51a602322734aeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As it happens, I am unable to keep maintaining those entries, and it is
misleading to others about whether they should Cc me on their changes.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 48 ------------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c2b6b1dda5..aedd736772 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3365,54 +3365,6 @@ F:	package/casync/
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
-F:	support/testing/tests/graphics_base.py
-
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
