Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E79D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE36B605DD;
	Sat, 26 Oct 2024 15:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY-cn0AWT_Ap; Sat, 26 Oct 2024 15:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206AF605DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206AF605DB;
	Sat, 26 Oct 2024 15:40:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 165715C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF0D406D3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTDPjqVeEhAy for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0718740356
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0718740356
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2BF083D19; Sat, 26 Oct 2024 15:40:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 17:36:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0631ac04ffdab7d43ea3831bc2162c3661a2b1c8
X-Git-Newrev: c2b00081941c71aef38d46acda992a5559ea609f
X-Patchwork-Hint: ignore
Message-Id: <20241026154003.E2BF083D19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2b00081941c71aef38d46acda992a5559ea609f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update of the vendored dependencies.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index ee42f18b80..c523dea46a 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fed91fd067605460ef33431163227471b1e85c8768203fc393345d6ffd645448  skopeo-1.16.0-go2.tar.gz
+sha256  9402e71f3fba979d0c0509240b963847bfeda2eac60be83eb5a628fd67d098e6  skopeo-1.16.1-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index f09009d88c..9859d774d4 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.16.0
+SKOPEO_VERSION = 1.16.1
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
