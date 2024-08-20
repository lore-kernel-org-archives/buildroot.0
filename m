Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377EDC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBF5240B5E;
	Tue, 20 Aug 2024 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Han8ZOEsB_gf; Tue, 20 Aug 2024 21:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B73EE40B87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B73EE40B87;
	Tue, 20 Aug 2024 21:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 737AF1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615F16071E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O33o-CejzNE2 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98CD260622
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98CD260622
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:25:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 827A5861BE; Tue, 20 Aug 2024 21:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 23:23:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dbb87bb6676b82f34981f6adedccfa03a9667cd
X-Git-Newrev: 77512bba98e09c7231a2629652e464dbf882fd23
X-Patchwork-Hint: ignore
Message-Id: <20240820212506.827A5861BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aumix: update AUMIX_SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=77512bba98e09c7231a2629652e464dbf882fd23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old URL gives 403 forbidden.
Use a working sourceforge URL.

Fixes:

  http://autobuild.buildroot.org/results/c0c3945cade7a6d7a615ac23523c93b02dbb056f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aumix/Config.in | 2 +-
 package/aumix/aumix.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aumix/Config.in b/package/aumix/Config.in
index 3d3208250c..058e73d7ee 100644
--- a/package/aumix/Config.in
+++ b/package/aumix/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_AUMIX
 	  automatically save and restore the mixer settings at shutdown
 	  and boot.
 
-	  http://jpj.net/~trevor/aumix.html
+	  https://sourceforge.net/projects/aumix/
diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index 03072d5d35..d5c2831dcd 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -6,7 +6,7 @@
 
 AUMIX_VERSION = 2.9.1
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
-AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
+AUMIX_SITE = https://sourceforge.net/projects/aumix/files/aumix/$(AUMIX_VERSION)
 AUMIX_AUTORECONF = YES
 AUMIX_AUTOPOINT = YES
 AUMIX_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
