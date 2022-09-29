Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1454611CF;
	Thu, 29 Sep 2022 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1454611CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fe7lqGZNgCq8; Thu, 29 Sep 2022 21:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1393E611C1;
	Thu, 29 Sep 2022 21:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1393E611C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F33461BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 739784011A
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 739784011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDD5IgjUbKSq for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:20:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAC3D40BA7
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC3D40BA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D95C386573; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 23:12:50 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2f7b664a9361effe18d42782feb115e8eb63eaa4
X-Git-Newrev: 6eeb91ef27ceeefb2c109b746fd854dba841e480
X-Patchwork-Hint: ignore
Message-Id: <20220929212027.D95C386573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/xtables-addons:
 bump to version 3.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=6eeb91ef27ceeefb2c109b746fd854dba841e480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

v3.21 (2022-06-13)

    xt_ECHO: support flowi6_to_flowi_common starting Linux 5.10.121

v3.20 (2022-04-10)

    Support for Linux 5.17

v3.19 (2022-02-01)

    bumped minimum supported kernel version from 4.15 to 4.16
    xt_condition: make mutex per-net
    xt_ipp2p: add IPv6 support
    xt_ECHO, xt_TARPIT: do not build IPv6 parts if kernel has IPv6 build-time disabled

v3.18 (2021-03-11)

    xt_pknock: fix a build failure on ARM 32-bit

https://fossies.org/linux/privat/xtables-addons-3.21.tar.xz/xtables-addons-3.21/doc/changelog.rst

Fixes:
 - http://autobuild.buildroot.org/results/b8f5f65cec1bd5c859f4a1fae4508900df362add

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e6ccf065de3e78e61a7e49ced9c61de3611077e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index a103fa3b52..0d2434eeb1 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a640535f209ec59467b8c8b4343b446801a21a112a3fc189818d6e2697f5cf1  xtables-addons-3.17.tar.xz
+sha256  2e09ac129a14f5e9c23b115ebcdfff4aa84e2aeba1268dbdf39b2d752bd71e19  xtables-addons-3.21.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index b3d1bf2d44..83cc3266c4 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.17
+XTABLES_ADDONS_VERSION = 3.21
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
