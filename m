Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40523C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B20C66322C
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 21:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B20C66322C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ABFA40291;
	Mon, 15 Nov 2021 21:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WKOLjnFFvS6; Mon, 15 Nov 2021 21:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51790401F8;
	Mon, 15 Nov 2021 21:58:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DECE51BF2F9
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB43401F8
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 21:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNdNlv9jgVsk for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 21:58:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A2A40012
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 21:58:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7CB548D3A2; Mon, 15 Nov 2021 21:54:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 22:58:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f2c9f3d58f051ce0baf53b936701083db2dbdae
X-Git-Newrev: 5fdcb18aecec28aedbacb86ecdcb29e59efcf56a
X-Patchwork-Hint: ignore
Message-Id: <20211115215430.7CB548D3A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/psplash: bump to
 revision 44afb75
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fdcb18aecec28aedbacb86ecdcb29e59efcf56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This includes the following changes:

44afb75 Add configure options to disable progress bar
fdbd111 Improve warnings from probing for double buffering
f5203fd Update mailing list details since the move to groups.io
0a902f7 Fix psplash-systemd failures
4cf1330 Remove generated psplash-poky-img.h
aea172a Makefile.am: Fix out of tree builds

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/psplash/psplash.hash | 2 +-
 package/psplash/psplash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 87fcdadd6d..77090d08f6 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2c1344dd8414415d80a01484b1cc29e78f99c31d5266189540e5966a7dc6e10e  psplash-fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c-br1.tar.gz
+sha256  c9f71754f4606e46212a4851d6c1145e4ae8752fd11a2b40e825f04bf79b22ec  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-br1.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 199509ecd6..5e61f2392f 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c
+PSPLASH_VERSION = 44afb7506d43cca15582b4c5b90ba5580344d75d
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
