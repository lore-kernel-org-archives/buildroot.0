Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4417EECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF1E2403FF;
	Sun, 23 Oct 2022 17:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1E2403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkJly_Otxo2n; Sun, 23 Oct 2022 17:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02DEB403E2;
	Sun, 23 Oct 2022 17:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02DEB403E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D12111BF470
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A185D8143A
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A185D8143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3rfXP9F7dxZ for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB40681443
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB40681443
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B91F186ECD; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 19:24:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a0dea25f4e92ac5aa474876f706ddb9452fe2b
X-Git-Newrev: 6024f64a7d0513398e2040a58ffcd9f2dbaeb566
X-Patchwork-Hint: ignore
Message-Id: <20221023172606.B91F186ECD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=6024f64a7d0513398e2040a58ffcd9f2dbaeb566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 3b5bbee23d..fb140fa198 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois/whois_5.5.13.dsc
-sha256  62e613f116d5635aea6684238db00b030a6602ffc79462e4a0a8e62cb184b5d7  whois_5.5.13.tar.xz
+# From http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois/whois_5.5.14.dsc
+sha256  bf9c2cb307d5419b34ad401eecf2820b8f69660db41cf0762e5da71fa2df68e8  whois_5.5.14.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 42a9e83954..5a85bea358 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.13
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.14
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
