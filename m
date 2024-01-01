Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D189C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35F3F41721;
	Mon,  1 Jan 2024 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35F3F41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vpjXVDAKlpL; Mon,  1 Jan 2024 21:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2868B41986;
	Mon,  1 Jan 2024 21:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2868B41986
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1716A1BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD54540645
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD54540645
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgywG2rYeYjT for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE8240612
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE8240612
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE6583B18; Mon,  1 Jan 2024 21:06:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:05:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cb3981129e74075f7244fecf76edbfc15f25986
X-Git-Newrev: bd3c51a295dca94d781dced8cacfbd0ca51ecba5
X-Patchwork-Hint: ignore
Message-Id: <20240101210632.EEE6583B18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neard: bump to version 0.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd3c51a295dca94d781dced8cacfbd0ca51ecba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/network/nfc/neard.git/tree/ChangeLog?h=v0.19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/neard/neard.hash | 2 +-
 package/neard/neard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index 1ea95c938a..b739d7289b 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c013e3115315e2e11d16b5f0f1c8ce9afbcdba26800aad91245fd9b4a5dc938b  neard-0.18.tar.gz
+sha256  129bbf69488fdb599d480356765941f111d7799495d0d64095b25e893c4d2be7  neard-0.19.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 51ba52fb90..c1804c48a2 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.18
+NEARD_VERSION = 0.19
 NEARD_SITE = https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot
 NEARD_LICENSE = GPL-2.0
 NEARD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
