Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA19C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69F360C1C;
	Tue, 27 Dec 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69F360C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0zOE1sWaY59; Tue, 27 Dec 2022 20:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A8160A69;
	Tue, 27 Dec 2022 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A8160A69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E23E1BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35050404D1
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35050404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueGZ8eR98Xr5 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB314047B
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB314047B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 484A386E74; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:58:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99127efe6ec2c8c056e252845326cc374859fa74
X-Git-Newrev: 4b473917001fa1145bec2ab118fac97dab0fc26e
X-Patchwork-Hint: ignore
Message-Id: <20221227200353.484A386E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b473917001fa1145bec2ab118fac97dab0fc26e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jirka-h/haveged/blob/v1.9.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 8c62ead7c3..61bf6cc9a1 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
+sha256  b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7  haveged-1.9.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 7035142aee..fbf72a96ad 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.15
+HAVEGED_VERSION = 1.9.18
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
