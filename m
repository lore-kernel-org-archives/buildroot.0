Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65165C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3426460A9D;
	Mon,  8 Jul 2024 21:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Rfr7mFRCIJ5; Mon,  8 Jul 2024 21:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9735960A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9735960A66;
	Mon,  8 Jul 2024 21:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7127C1BF409
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A176403F7
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkD_BbClZyPG for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3DB403F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3DB403F4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73BD083E42; Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:00:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab9aca21d026bb7e8e9d63f928d97278a4fabceb
X-Git-Newrev: 4f5790116b42768bd1bd982245e00483440a6311
X-Patchwork-Hint: ignore
Message-Id: <20240708210142.73BD083E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edid-decode: bump version to
 6f117a8
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f5790116b42768bd1bd982245e00483440a6311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 9a2012f06b..62e6b43a32 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45b71227ceb7265da3a314a8d0969dcca584bfa12c36690e911646b58aae0738  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-git4.tar.gz
+sha256  bc166bef5d0d56035b47a1513ed320c262901f97e488c83420760d7f56174dac  edid-decode-6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1-git4.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index cc9f2c1629..be0c4f1a0e 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
+EDID_DECODE_VERSION = 6f117a8f8c0e76e85f599a8b05c21c5f51c5c3c1
 EDID_DECODE_SITE = https://git.linuxtv.org/edid-decode.git
 EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
