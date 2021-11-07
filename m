Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F58C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC5660F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DC5660F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F48240256;
	Sun,  7 Nov 2021 20:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Nyaq6GhBXma; Sun,  7 Nov 2021 20:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B34C240254;
	Sun,  7 Nov 2021 20:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E18C1BF977
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B56980DBF
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8a4Ap_mpD15 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8578480DBE
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0ECD8B4B0; Sun,  7 Nov 2021 20:20:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:23:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8f847c4f4dd5a49ad2c01717ffa41f7827d06b1
X-Git-Newrev: c922c71e4463e21b06dd8c0a4a26279e14a9a19f
X-Patchwork-Hint: ignore
Message-Id: <20211107202017.B0ECD8B4B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=c922c71e4463e21b06dd8c0a4a26279e14a9a19f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37376434/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 88deb343c4..9935858b20 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37350119/
-sha256  cc6818bd59435602169fa292d6d163d56b21c7f53112829470a3aceabe612c84  fetchmail-6.4.22.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37376434/
+sha256  5f7a5e13731431134a2ca535bbced7adc666d3aeb93169a0830945d91f492300  fetchmail-6.4.23.tar.xz
 # Locally computed:
 sha256  001d1b8d111a83e3bab8b4d511ea4767d37d3bd0583560fccece630df1ba8f3c  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 77d9733296..c909bb5cfb 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).22
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).23
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
