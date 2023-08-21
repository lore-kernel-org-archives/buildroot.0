Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB5EEE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6D681E45;
	Mon, 21 Aug 2023 10:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6D681E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXKSkYMBHKnT; Mon, 21 Aug 2023 10:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6873981E43;
	Mon, 21 Aug 2023 10:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6873981E43
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 842451BF2C9
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E984044F
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E984044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WI2LvPB9JVcj for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 10:44:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75843400D7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 10:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75843400D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61BDB85F1F; Mon, 21 Aug 2023 10:44:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 12:02:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a78241af67cc3c6f26d5f82f9504bd15506df0b5
X-Git-Newrev: 8f1418b5dd80809dc90196d967d8d9665b794c8e
X-Patchwork-Hint: ignore
Message-Id: <20230821104439.61BDB85F1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnupg2: bump to
 version 2.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f1418b5dd80809dc90196d967d8d9665b794c8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2023q3/000480.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index aa71881f41..4b770fa520 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  3efd495a94dc81fd0ea8788bef6c69d1f13cedd7  gnupg-2.4.2.tar.bz2
-sha256  97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49  gnupg-2.4.2.tar.bz2
+sha1  79a60c8e415e3daaa33d0546398174252a56f7ac  gnupg-2.4.3.tar.bz2
+sha256  a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d  gnupg-2.4.3.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 760af3b05e..d21c1e242d 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.2
+GNUPG2_VERSION = 2.4.3
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
