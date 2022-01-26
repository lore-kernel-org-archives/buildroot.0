Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E8A417FB;
	Wed, 26 Jan 2022 22:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4ptbnaFzMEl; Wed, 26 Jan 2022 22:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9E641804;
	Wed, 26 Jan 2022 22:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5CD1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F14B584CC8
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g23g6I_zp2-e for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E49B84C76
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B04DD8276A; Wed, 26 Jan 2022 22:03:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:09:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f53928c2cb9bcc188a2586fc97535c2238ead50b
X-Git-Newrev: a7deb5618efefdef4d4a6eac2b4c4dc3c11d484c
X-Patchwork-Hint: ignore
Message-Id: <20220126220305.B04DD8276A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7deb5618efefdef4d4a6eac2b4c4dc3c11d484c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 1478d60697..4bdfd74b20 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois/whois_5.5.10.dsc
-sha256  2391037b079695d0e9fd3c85ab021809a539cf093d25b6c51ca65019a54158dd  whois_5.5.10.tar.xz
+# From http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois/whois_5.5.11.dsc
+sha256  966281eb8301c14a1acc17e46c70061f73179d80e370aef43065c22f0947fb87  whois_5.5.11.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index c5d0a6f2ad..544cb9c2f7 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.10
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.11
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
