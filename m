Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EF7C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE5D41B67;
	Sat, 29 Jul 2023 09:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DE5D41B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9LI8A6qJC6c; Sat, 29 Jul 2023 09:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528D840261;
	Sat, 29 Jul 2023 09:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528D840261
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B65861BF475
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD1A837B6
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD1A837B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkisbBtZKsc7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:04:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C326E83478
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C326E83478
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2B7A83AA4; Sat, 29 Jul 2023 09:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 11:03:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f868fd9e3d5cb15c089b201b07c3062b3b176f34
X-Git-Newrev: 315446d44ca4c57a47d5a29f76a67b3ff612f179
X-Patchwork-Hint: ignore
Message-Id: <20230729090433.B2B7A83AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshpass: bump to version 1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=315446d44ca4c57a47d5a29f76a67b3ff612f179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog 1.09 -> 1.10:
ef1034d Tag version 1.10
c596390 Controlling TTY code fix.
32b7553 Help message problems
c89cee9 Convert repository from SVN to git
934f87f Sig unsafe functions in signal handler
ed856e6 Better "-e" handling.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sshpass/sshpass.hash | 2 +-
 package/sshpass/sshpass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index cb8968bca4..3fe95c8b0f 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7  sshpass-1.09.tar.gz
+sha256  ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda  sshpass-1.10.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
index 21e10397b6..beb0a63911 100644
--- a/package/sshpass/sshpass.mk
+++ b/package/sshpass/sshpass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHPASS_VERSION = 1.09
+SSHPASS_VERSION = 1.10
 SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
 SSHPASS_LICENSE = GPL-2.0+
 SSHPASS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
