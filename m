Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D3BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B782640129;
	Mon, 20 Dec 2021 22:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5q3Fes_8U9o; Mon, 20 Dec 2021 22:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6A254019D;
	Mon, 20 Dec 2021 22:42:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC9F1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15465409B4
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46wPwxa7mC0j for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC8F409BC
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 323E0828B8; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ff4fa08c4d1dcbfd5a0b62a6a8d3f65af5eaff0
X-Git-Newrev: e114e9f7927c1a209ac07ceaccd5d41b8ba79331
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.323E0828B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshpass: bump to version 1.09
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

commit: https://git.buildroot.net/buildroot/commit/?id=e114e9f7927c1a209ac07ceaccd5d41b8ba79331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/sshpass/code/HEAD/tree/tags/V1.09/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sshpass/sshpass.hash | 2 +-
 package/sshpass/sshpass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index 9635a91806..cb8968bca4 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60  sshpass-1.06.tar.gz
+sha256  71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7  sshpass-1.09.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index 6c14f0fe7d..21e10397b6 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHPASS_VERSION = 1.06
+SSHPASS_VERSION = 1.09
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
 SSHPASS_LICENSE = GPL-2.0+
 SSHPASS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
