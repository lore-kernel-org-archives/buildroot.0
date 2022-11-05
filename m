Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C27BA8133A;
	Sat,  5 Nov 2022 22:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C27BA8133A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nP0Dg2aQrfh5; Sat,  5 Nov 2022 22:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01EA81307;
	Sat,  5 Nov 2022 22:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01EA81307
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 605401BF86D
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47DC34067F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47DC34067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prMai2d5E4Am for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:44:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53CF140629
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53CF140629
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 426E287F81; Sat,  5 Nov 2022 22:44:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:43:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbf3253d76399f2b310120e87c29569dd65749cc
X-Git-Newrev: 8e2d08c583228e48c622e0adc2ba577cded40ad2
X-Patchwork-Hint: ignore
Message-Id: <20221105224436.426E287F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ninja: bump to version
 1.11.1.g95dee.kitware.jobserver-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e2d08c583228e48c622e0adc2ba577cded40ad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index ecde199844..57c10bb287 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  549c31ee596566b952c600e23eb9b8d39a4112cd5fdeb2e5a83370669176da40  ninja-1.10.2.g51db2.kitware.jobserver-1.tar.gz
+sha256  7ba84551f5b315b4270dc7c51adef5dff83a2154a3665a6c9744245c122dd0db  ninja-1.11.1.g95dee.kitware.jobserver-1.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index bc84046414..b7bc1a4f1c 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NINJA_VERSION_MAJOR = 1.10.2
-NINJA_VERSION = $(NINJA_VERSION_MAJOR).g51db2.kitware.jobserver-1
+NINJA_VERSION_MAJOR = 1.11.1
+NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
 NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
