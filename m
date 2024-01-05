Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A27C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9207F43649;
	Fri,  5 Jan 2024 08:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9207F43649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AknH-KKt5MWK; Fri,  5 Jan 2024 08:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597194367C;
	Fri,  5 Jan 2024 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597194367C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA48F1BF30D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19BC43553
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A19BC43553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GddDWGV4Q9Vr for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C2D40141
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52C2D40141
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D0DE84375; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 09:44:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a608e519a028a8218c5190c8fd417df33173347c
X-Git-Newrev: 5594570a0c2ebb162ae304d7dca92aadf8f439ad
X-Patchwork-Hint: ignore
Message-Id: <20240105084541.3D0DE84375@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-tools: bump to version 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5594570a0c2ebb162ae304d7dca92aadf8f439ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/asterisk/dahdi-tools/releases/tag/v3.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dahdi-tools/dahdi-tools.hash | 4 ++--
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index c119ff4ee1..1251617286 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,5 +1,5 @@
-# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.2.0.sha256
-sha256  2bc269887fcd42d2486572611934d713e603734cc658b3b517fc9f3bdea7262f  dahdi-tools-3.2.0.tar.gz
+# From http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases/dahdi-tools-3.3.0.sha256
+sha256  5706b37df5840ecdc524d4c86df2ad34a31f83db552a8519b4ccf61bac75d2e4  dahdi-tools-3.3.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index 7d4de645a2..056b29156d 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.2.0
+DAHDI_TOOLS_VERSION = 3.3.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
