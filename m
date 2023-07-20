Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A62EEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F68E60597;
	Thu, 20 Jul 2023 21:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F68E60597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1tHkfC29qPt; Thu, 20 Jul 2023 21:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463BB6129C;
	Thu, 20 Jul 2023 21:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463BB6129C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7DC1BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2263741DB0
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2263741DB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZiHZKkTILvs for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87BA841DB1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BA841DB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 731CB8749D; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c24761f77f18b53008201cb53cb0fdd82143103
X-Git-Newrev: e46856b4a905ba13c90ee7d491c7d18128130d12
X-Patchwork-Hint: ignore
Message-Id: <20230720211019.731CB8749D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-goldrush: bump version to
 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e46856b4a905ba13c90ee7d491c7d18128130d12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-goldrush/erlang-goldrush.hash | 2 +-
 package/erlang-goldrush/erlang-goldrush.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
index 237bc8810c..ff4c8d64af 100644
--- a/package/erlang-goldrush/erlang-goldrush.hash
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612  erlang-goldrush-0.1.9.tar.gz
+sha256  45eb313413226933fcb8d723d087e82563dbd80897b236c45ac3a7016a7d192f  erlang-goldrush-0.2.0.tar.gz
 sha256  335dd315c1bf12bd9bde777666c45e92652c9fe633101b12fc6f927b88433b6f  LICENSE
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index e95b09cd86..562317b77a 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_GOLDRUSH_VERSION = 0.1.9
+ERLANG_GOLDRUSH_VERSION = 0.2.0
 ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
 ERLANG_GOLDRUSH_LICENSE = ISC
 ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
