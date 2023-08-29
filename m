Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B45C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC4082093;
	Tue, 29 Aug 2023 13:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC4082093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWpszXz-qOjI; Tue, 29 Aug 2023 13:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5D808209D;
	Tue, 29 Aug 2023 13:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D808209D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0C01BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB7F681F52
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB7F681F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ozo_lq7bku-R for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5353282047
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5353282047
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4344386420; Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 14:41:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5e9f5d78bf808e2ba8b97fd7a3f4b74e968b1a1
X-Git-Newrev: e79533c751188383a2d08220841aabf02286cc60
X-Patchwork-Hint: ignore
Message-Id: <20230829130112.4344386420@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mutt: bump version to
 2.2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=e79533c751188383a2d08220841aabf02286cc60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See http://mutt.org/ for any news.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index c475641ab5..78bce76585 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa531b231d58fe1f30ceda0ed626683ea9ebdfb76ce47ef8bb27c2f77422cffb  mutt-2.2.9.tar.gz
+sha256  12325cf66d5ff8ac4bd87fac8db52c869de52dd278fc301cfd57d5a1f9f465cc  mutt-2.2.11.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5cf1b6bad2..c5e4e4a14e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.9
+MUTT_VERSION = 2.2.11
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
