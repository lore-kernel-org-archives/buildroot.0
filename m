Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1019ECDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCD9B414EA;
	Sun, 15 Oct 2023 20:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD9B414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9AeVzIVfqBG; Sun, 15 Oct 2023 20:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8DF414BF;
	Sun, 15 Oct 2023 20:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8DF414BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 438051BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B4C441761
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B4C441761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8y9_ama5T7U7 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:04:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF8CD4175D
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF8CD4175D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF4E785782; Sun, 15 Oct 2023 20:04:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:02:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 087e2cef0e96609032e80c44d54fa7c4021277d8
X-Git-Newrev: cebff375c230386adef9ccbba5074042d0d0da7d
X-Patchwork-Hint: ignore
Message-Id: <20231015200412.DF4E785782@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waf: bump to v2.0.26
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cebff375c230386adef9ccbba5074042d0d0da7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index c8d464ebfb..1ad535febb 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  9cc6db88ecda57067024f368722ecbf48a3bba1a  waf-2.0.24
-sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf-2.0.24
+sha1  e310e29a44f23f80591f2aa6c2d4c30e5f1a26a8  waf-2.0.26
+sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf-2.0.26
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  93909bca823a675f9f40af7c65b24887c3a3c0efdf411ff1978ba827194bdeb0  waf
+sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index d98ab489ca..bffa27a926 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.24
+WAF_VERSION = 2.0.26
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
