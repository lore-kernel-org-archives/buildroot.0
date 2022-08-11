Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE4C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E0360F6C;
	Thu, 11 Aug 2022 21:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E0360F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpjyZomn7qjv; Thu, 11 Aug 2022 21:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 735F860B59;
	Thu, 11 Aug 2022 21:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 735F860B59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71B21BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C030060FA2
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C030060FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 329a_r-x00Sz for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:02:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8B1600B6
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D8B1600B6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 047F4873A1; Thu, 11 Aug 2022 20:48:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 23:02:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 726902e78c9645e19cbff28719f277bdbdf9526b
X-Git-Newrev: 96f84b23751d378aecf8c617330b137905915818
X-Patchwork-Hint: ignore
Message-Id: <20220811204800.047F4873A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=96f84b23751d378aecf8c617330b137905915818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0fc2438ff6e3d14cc9e7b546e2909e386db33439 forgot to update hash of
LICENSE (full text of MPLv2 included with
https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4)

Fixes:
 - http://autobuild.buildroot.org/results/98b820f85cd32596bde6bbee2cfc7e07ecfa454b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/grpc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 84af11f5a1..d7c1b89aca 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  9b1f348b15a7637f5191e4e673194549384f2eccf01fcef7cc1515864d71b424  grpc-1.48.0.tar.gz
-sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
+sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
