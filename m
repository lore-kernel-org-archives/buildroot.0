Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1710C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2EA415D2;
	Wed, 10 Jul 2024 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSStoCDBmO-q; Wed, 10 Jul 2024 22:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B147941692
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B147941692;
	Wed, 10 Jul 2024 22:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4A61BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C491413B2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7-Kn4KYDqgh for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C6C408C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C6C408C1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBF5384A1A; Wed, 10 Jul 2024 22:15:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 295ba8991537a26060cd47421240239fb111b694
X-Git-Newrev: 916f9bb1a3d1422c80bb37fa096f361fe1e75212
X-Patchwork-Hint: ignore
Message-Id: <20240710221545.BBF5384A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: bump driver version to
 latest
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

commit: https://git.buildroot.net/buildroot/commit/?id=916f9bb1a3d1422c80bb37fa096f361fe1e75212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update driver for kernel 6.9+
- Fix warning/errors on build

Fixes: http://autobuild.buildroot.net/results/82dd4d986c0ddfb48e7316473186ef4c9d8ee783

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 34bcc412ce..53fc06cca5 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
+sha256  9aea86233848e9edb497b27614c78680f7bb1962579d4b05333d9c1a189c62fe  rtl8822cs-40450f759c8a930d271b5f0a663685f412debc72.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index dbdc7d84bf..223d232c8d 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
+RTL8822CS_VERSION = 40450f759c8a930d271b5f0a663685f412debc72
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
