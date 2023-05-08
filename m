Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D2EC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D5ED41795;
	Mon,  8 May 2023 19:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D5ED41795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7kf8W51D43K; Mon,  8 May 2023 19:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3351B40B5E;
	Mon,  8 May 2023 19:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3351B40B5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A23FA1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82DE440B5E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DE440B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dady5iPmc3cN for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:18:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 973FB4000B
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 973FB4000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8491C8615B; Mon,  8 May 2023 19:18:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:17:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37fd4ee80a408d8fa810eb1926cac111acbba811
X-Git-Newrev: 9cc48fb94a4f3594f378f6fb5b6a98b0bbb80743
X-Patchwork-Hint: ignore
Message-Id: <20230508191839.8491C8615B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libass: bump version to 0.17.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cc48fb94a4f3594f378f6fb5b6a98b0bbb80743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/libass/libass/releases/tag/0.17.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index beb7639b1f..bf9b8251d7 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  971e2e1db59d440f88516dcd1187108419a370e64863f70687da599fdf66cc1a  libass-0.17.0.tar.xz
+sha256  f0da0bbfba476c16ae3e1cfd862256d30915911f7abaa1b16ce62ee653192784  libass-0.17.1.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 1cc8310312..8b14c899c4 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.17.0
+LIBASS_VERSION = 0.17.1
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
