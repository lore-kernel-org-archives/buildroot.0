Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA796C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 827C7844CC;
	Sat, 19 Jul 2025 10:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tWkfGxZwEsJ; Sat, 19 Jul 2025 10:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0E6844B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD0E6844B9;
	Sat, 19 Jul 2025 10:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 176BC117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1430E41BD7
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D18hRTwcreV5 for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6661141BD5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6661141BD5
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:40:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F7A8865A3; Sat, 19 Jul 2025 10:40:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:27:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1b4657bc0f53d6f102f0ec0100cfdc88b1a5eec
X-Git-Newrev: c42b26bb471a260e2bb3da7988af77f78b2b4280
X-Patchwork-Hint: ignore
Message-Id: <20250719104058.5F7A8865A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireplumber: bump to 0.5.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c42b26bb471a260e2bb3da7988af77f78b2b4280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.10/NEWS.rst

Signed-off-by: Florian Larysch <fl@n621.de>
[Julien: update release note url to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index 7fff34a7a7..a254b68cca 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4926399cffe3da12f1338e1feec53ef944e86ae7c719384bff87490d7e3edbc7  wireplumber-0.5.5.tar.bz2
+sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index c8cc1ad106..8818662059 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.5
+WIREPLUMBER_VERSION = 0.5.10
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
