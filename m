Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0710C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B565611CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B565611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5619C4043C;
	Sat, 11 Sep 2021 13:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xf86eVWBOSb; Sat, 11 Sep 2021 13:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5DA40411;
	Sat, 11 Sep 2021 13:24:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 103EB1BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D186607CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5u-Aj27y3BEi for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:23:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25D18607CC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2098D88F7E; Sat, 11 Sep 2021 13:22:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 15:23:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7834f04a38a9459b8dbf751ee5b867b602c3640c
X-Git-Newrev: d8bc9b4d86db9839b5f83c83cd5b3ab710a0782d
X-Patchwork-Hint: ignore
Message-Id: <20210911132200.2098D88F7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: bump version
 to 0.5.16
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8bc9b4d86db9839b5f83c83cd5b3ab710a0782d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-August/000464.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 58444ab7e8..3b7c04834c 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  e1498f50cef74c351a57474cc423b008627ab1ab60724b859283ead6d00550d0  dovecot-2.3-pigeonhole-0.5.15.tar.gz
+sha256  5ca36780e23b99e6206440f1b3fe3c6598eda5b699b99cebb15d418ba3c6e938  dovecot-2.3-pigeonhole-0.5.16.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index c0bef6bedc..490bad35c6 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.15
+DOVECOT_PIGEONHOLE_VERSION = 0.5.16
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
