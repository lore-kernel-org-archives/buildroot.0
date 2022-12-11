Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6C84088F;
	Sun, 11 Dec 2022 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6C84088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWDvcdUb9S1y; Sun, 11 Dec 2022 13:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D438E40510;
	Sun, 11 Dec 2022 13:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D438E40510
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8631BF868
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8670B60BC9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8670B60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llq2h_Hl59CJ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF28960BBD
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF28960BBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 975F9863F5; Sun, 11 Dec 2022 13:34:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:32:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f8dacd79bb578b61b710d626cfa82ed64d5a2ec
X-Git-Newrev: 84463af7c42bc0d81ea0e03de911f5b1b4ef57c9
X-Patchwork-Hint: ignore
Message-Id: <20221211133400.975F9863F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=84463af7c42bc0d81ea0e03de911f5b1b4ef57c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://ipset.netfilter.org/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9c251be27e..fb9b8c40d2 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.15.tar.bz2.sha512sum.txt
-sha512  0fc936d971c30a0925c585d506c8840e782fdaeec09bc8fd249e874fe838fa55a4dbb697f6e1423a6769abf07a1ce2195abc37cb641e8e4ad70f1b4c7130916a  ipset-7.15.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.16.tar.bz2.sha512sum.txt
+sha512  e69ddee956f0922c8e08e7e5d358d6b5b24178a9f08151b20957cc3465baaba9ecd6aa938ae157f2cd286ccd7f0b7a279cfd89cec2393a00b43e4d945c275307  ipset-7.16.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 4eda65e81b..9832d8fd30 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.15
+IPSET_VERSION = 7.16
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
