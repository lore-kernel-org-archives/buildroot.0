Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3D8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82448404DD;
	Wed,  6 Jul 2022 21:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82448404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWjJXAX-1k8z; Wed,  6 Jul 2022 21:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85FCC403E2;
	Wed,  6 Jul 2022 21:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85FCC403E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45D581BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2007B403E2
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2007B403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWGIuMW_vSSi for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:14:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C73440134
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C73440134
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 93B9582942; Wed,  6 Jul 2022 21:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:14:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d932260f8fa95a9c27fb011943ceee5a29f6ebf6
X-Git-Newrev: 03edfd96e85a6f008a53685088fde3d2d58797b3
X-Patchwork-Hint: ignore
Message-Id: <20220706210142.93B9582942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memtester: bump to version 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=03edfd96e85a6f008a53685088fde3d2d58797b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pyropus.ca./software/memtester/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/memtester/memtester.hash | 2 +-
 package/memtester/memtester.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index 7d7820e746..6e5d156ffd 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ed52b0d06d4aeb61954994146e2a5b2d20448a8f3ce3ee995120e6dbde2ae37  memtester-4.5.0.tar.gz
+sha256  1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47  memtester-4.5.1.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index ec515f6392..347a158b74 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTESTER_VERSION = 4.5.0
+MEMTESTER_VERSION = 4.5.1
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
