Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE0BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17BEA83E20;
	Mon, 25 Jul 2022 22:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17BEA83E20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSQWI5F4Dxmr; Mon, 25 Jul 2022 22:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104A183E1A;
	Mon, 25 Jul 2022 22:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104A183E1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25EFF1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D096E41B35
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D096E41B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7X45TePAH1C for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8689441A5D
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8689441A5D
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 30A6C85E6B; Mon, 25 Jul 2022 22:15:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:14:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ec2f43ff87ad543fd695232b93af737403081cd
X-Git-Newrev: 94a657fe4cdd0303b374ba01ba43d2d2b8d6eb8b
X-Patchwork-Hint: ignore
Message-Id: <20220725221521.30A6C85E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netifrc: bump to version 0.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=94a657fe4cdd0303b374ba01ba43d2d2b8d6eb8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netifrc/netifrc.hash | 4 ++--
 package/netifrc/netifrc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netifrc/netifrc.hash b/package/netifrc/netifrc.hash
index d811acc4a2..e92c394018 100644
--- a/package/netifrc/netifrc.hash
+++ b/package/netifrc/netifrc.hash
@@ -1,3 +1,3 @@
 # Calculated manually
-sha256	004907e0c3db2d106d6a51d604d79f971f1013fa7642054ad7efe5076e52f7b3	netifrc-0.6.1.tar.gz
-sha256	da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a	LICENSE
+sha256  ad6578bf0c08eac474fa7b557beda0aed1032bef410a01f0493395cd6568128e  netifrc-0.7.3.tar.gz
+sha256  da376c9e2244f2a7220767ea4dd88cf423ff5b548e7c2f96b0f3b9dac727748a  LICENSE
diff --git a/package/netifrc/netifrc.mk b/package/netifrc/netifrc.mk
index d13dc356f3..dfa1c96bb8 100644
--- a/package/netifrc/netifrc.mk
+++ b/package/netifrc/netifrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETIFRC_VERSION = 0.6.1
+NETIFRC_VERSION = 0.7.3
 NETIFRC_SITE = $(call github,gentoo,netifrc,$(NETIFRC_VERSION))
 NETIFRC_LICENSE = BSD-2-Clause
 NETIFRC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
