Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2EAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD7760FE8
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AD7760FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13EF582E5F;
	Thu, 21 Oct 2021 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtwXmlWpCq8U; Thu, 21 Oct 2021 20:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7932182CFA;
	Thu, 21 Oct 2021 20:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC0B1BF9CB
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 161F540764
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z5hhmHm1V1g for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C50640314
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 18E0D88348; Thu, 21 Oct 2021 20:32:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:27:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77b05e12df43711525c2cd08bff1b8949f1c519a
X-Git-Newrev: 1825528afc904327a90ac711a2093fd24919dc98
X-Patchwork-Hint: ignore
Message-Id: <20211021203202.18E0D88348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liberation: bump to version 2.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1825528afc904327a90ac711a2093fd24919dc98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liberation/liberation.hash | 2 +-
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index 1f673228e5..70b44e4873 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef  liberation-fonts-ttf-2.1.4.tar.gz
+sha256  7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0  liberation-fonts-ttf-2.1.5.tar.gz
 sha256  93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b  LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index c08ca378e8..35f06dc275 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.1.4
-LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/6418984
+LIBERATION_VERSION = 2.1.5
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/7261482
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
