Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C23C71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A99B811A6;
	Mon, 16 Jun 2025 20:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOhTeptyHC_3; Mon, 16 Jun 2025 20:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD11881195
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD11881195;
	Mon, 16 Jun 2025 20:20:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8070116B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6625E608D5
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQCVS-km82EB for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A73607C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87A73607C8
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:20:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FB8A81E69; Mon, 16 Jun 2025 20:20:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 22:13:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c967602d27f5c2368d63966a5253fc7b0b17cda9
X-Git-Newrev: 94ca658661c30f0f7d557b3227f5dd40e293bdf4
X-Patchwork-Hint: ignore
Message-Id: <20250616202041.7FB8A81E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: bump to 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=94ca658661c30f0f7d557b3227f5dd40e293bdf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announce:
https://www.libvolk.org/release-v320.html

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Julien: add link to release announce]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/volk/volk.hash | 2 +-
 package/volk/volk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 3a363f0357..a24967f28b 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce62f645c2ee3ef8b38f923de78ef4df9a1b7696d618f57781955803ee29bab3  volk-3.1.2.tar.xz
+sha256  93fcf717545f5e60491c57fd8dd348d814d3f95332d9dada5e53ab38015ff90a  volk-3.2.0.tar.xz
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 396f4e6e8b..7b10f57bac 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VOLK_VERSION = 3.1.2
+VOLK_VERSION = 3.2.0
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 VOLK_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
