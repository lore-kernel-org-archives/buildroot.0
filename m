Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28921C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6354164E;
	Thu, 13 Jan 2022 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pagrJec7H9zr; Thu, 13 Jan 2022 19:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF3441642;
	Thu, 13 Jan 2022 19:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 908191BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F5A984CDB
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XexAwdNpTQy4 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C96AD84CD9
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 943B18356C; Thu, 13 Jan 2022 19:37:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:42:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11b347c03ab0b38389ec11b48f63236a3b4d6547
X-Git-Newrev: 4b051086ab11b2aeeb57465ce3d861ab526846a5
X-Patchwork-Hint: ignore
Message-Id: <20220113193713.943B18356C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/omniorb: bump to version 4.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b051086ab11b2aeeb57465ce3d861ab526846a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/omniorb/omniorb.hash | 12 ++++++------
 package/omniorb/omniorb.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index 5ac8614689..f522c1ef67 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.4/
-sha1 a6f3c8e96fc09c4ef8d75bd495bbc5256a4773ee  omniORB-4.2.4.tar.bz2
-md5 de961e8aa29f3eed95ea40a94c1cccdf  omniORB-4.2.4.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0/
+sha1  c3f12c2278f8c4603910c02c8fe892c1dde7217e  omniORB-4.3.0.tar.bz2
+md5  8889ab13b444b495ca2c2b48ea6a6bd7  omniORB-4.3.0.tar.bz2
 
 # Locally generated
-sha256	28c01cd0df76c1e81524ca369dc9e6e75f57dc70f30688c99c67926e4bdc7a6f  omniORB-4.2.4.tar.bz2
-sha256	126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
-sha256	eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
+sha256  976045a2341f4e9a85068b21f4bd928993292933eeecefea372db09e0219eadd  omniORB-4.3.0.tar.bz2
+sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
+sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 4ecbb9d2c9..a1943968f1 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.2.4
+OMNIORB_VERSION = 4.3.0
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
