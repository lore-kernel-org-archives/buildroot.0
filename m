Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E651C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E2382A29;
	Tue, 21 Feb 2023 08:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E2382A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLZWPmpM4SRD; Tue, 21 Feb 2023 08:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434C082A72;
	Tue, 21 Feb 2023 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434C082A72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70B531BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDEE40BAE
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDEE40BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOTeTewnYFC4 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 378A040A04
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 378A040A04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22A3C865DB; Tue, 21 Feb 2023 08:55:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:48:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3706f1e0b7008674169809166c414825a551d04
X-Git-Newrev: b851097ba6db559042183eb31dc48dc1533fac04
X-Patchwork-Hint: ignore
Message-Id: <20230221085502.22A3C865DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/networkd-dispatcher:
 bump to version 2.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b851097ba6db559042183eb31dc48dc1533fac04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
 package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
index ffb4fa846a..f50dd75163 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.hash
+++ b/package/networkd-dispatcher/networkd-dispatcher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  61270b4c2f39c36da4b0a62724a3cc01f6732493fed0f166ee675bafedff11df  networkd-dispatcher-2.2.3.tar.bz2
+sha256  993086fa2dab11ba6b54a121adaccbd4c679ce3c8b3193cfa5c00500c28cbdf9  networkd-dispatcher-2.2.4.tar.bz2
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
index 2b1aa257ce..a3e0319c10 100644
--- a/package/networkd-dispatcher/networkd-dispatcher.mk
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORKD_DISPATCHER_VERSION = 2.2.3
+NETWORKD_DISPATCHER_VERSION = 2.2.4
 NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
 NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
 NETWORKD_DISPATCHER_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
