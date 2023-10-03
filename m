Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10316E8FDB4
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B24F560ECE;
	Tue,  3 Oct 2023 20:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24F560ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pe_u3EdzTD9h; Tue,  3 Oct 2023 20:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE25661204;
	Tue,  3 Oct 2023 20:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE25661204
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73F031BF578
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4B540897
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4B540897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJE0QXr4hbeT for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:35:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FEE9408E4
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEE9408E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BDCA84171; Tue,  3 Oct 2023 20:35:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Oct 2023 22:35:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d4443343aa6ddd8f7eca40ffdcf8decb4c290f0
X-Git-Newrev: 24c8e0440bdd9035f1e7b23a0f90a130473a751e
X-Patchwork-Hint: ignore
Message-Id: <20231003203542.7BDCA84171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: bump to version 20230924
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

commit: https://git.buildroot.net/buildroot/commit/?id=24c8e0440bdd9035f1e7b23a0f90a130473a751e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/BXBS6HOFXCMOF3LKCOVWXDPRD43S6B3Z

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index 9ce91330fd..aca098d982 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  a3cebee7a87ecf1bca0645f125be78fbd7b37846a4da82fecef96b92cc64d050  udpcast-20211207.tar.gz
+sha256  17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1  udpcast-20230924.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 4ea73e20c7..64a0bfbd37 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20211207
+UDPCAST_VERSION = 20230924
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
