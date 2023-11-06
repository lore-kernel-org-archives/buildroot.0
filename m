Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52EDC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8982B42129;
	Mon,  6 Nov 2023 22:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8982B42129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIAyh3LtoaOA; Mon,  6 Nov 2023 22:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A6D1415FB;
	Mon,  6 Nov 2023 22:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A6D1415FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C865E1BF947
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD731401CC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD731401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDG2wMFTn8Qf for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50541401AD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50541401AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AE3986B2C; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:47:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b2da40749392319d45869b50f2b8362987eff38
X-Git-Newrev: cd24016907771836592f5edd87aa93d4c5d6da1d
X-Patchwork-Hint: ignore
Message-Id: <20231106220204.3AE3986B2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: bump to version 7.94
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd24016907771836592f5edd87aa93d4c5d6da1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file:
Updated the Nmap Public Source License (NPSL) to Version 0.95. This just
clarifies that the derivative works definition and all other license
clauses only apply to parties who choose to accept the license in return
for the special rights granted (such as Nmap redistribution rights). If
a party can do everything they need to using copyright provisions
outside of this license such as fair use, we support that and aren't
trying to claim any control over their work. Versions of Nmap released
under previous versions of the NPSL may also be used under the NPSL 0.95
terms.

https://nmap.org/changelog#7.94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index dc379f30d4..99c5d5fb07 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.92.tar.bz2.digest.txt (lowercase)
-sha256  a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1  nmap-7.92.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.94.tar.bz2.digest.txt (lowercase)
+sha512  a55cddf9c1d9272243d01251eb3315b26f232d0596818857083222a385398618b428dc2bd8282c3e832527e135a74aeb020ca8609d83d8337342f5d8a04d7f2c  nmap-7.94.tar.bz2
 
 # Locally calculated
-sha256  133794301a764dfe8a60e38601e56657b7113e0337b452189725bbbed58baea0  LICENSE
+sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index f22a2295b1..6cd9d96119 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.92
+NMAP_VERSION = 7.94
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
