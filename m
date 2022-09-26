Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15175C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E9D40C0B;
	Mon, 26 Sep 2022 12:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E9D40C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLX7gMcFE0k7; Mon, 26 Sep 2022 12:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3D4840BFF;
	Mon, 26 Sep 2022 12:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D4840BFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCC31BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA17C60F71
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA17C60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAVPKxNhIyJz for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:02:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EF4C60F6F
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EF4C60F6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE7486023; Mon, 26 Sep 2022 12:02:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:02:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af56cfe372a064a3de2e3baf446cdc59f81cdfd7
X-Git-Newrev: 5195770cc8b46a9d51caab8d02bb086e4a0b249f
X-Patchwork-Hint: ignore
Message-Id: <20220926120253.EEE7486023@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waf: bump to v2.0.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=5195770cc8b46a9d51caab8d02bb086e4a0b249f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 21f47f76d8..c8d464ebfb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  89b24f9c19328339c2c8103796755474b66f3a8d  waf-2.0.23
-sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf-2.0.23
+sha1  9cc6db88ecda57067024f368722ecbf48a3bba1a  waf-2.0.24
+sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf-2.0.24
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  28a2e4583314a162cfcbffefb8a9202c1d7869040d30b5852da479b76d9c0491  waf
+sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 2b1808ace4..d98ab489ca 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.23
+WAF_VERSION = 2.0.24
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
