Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D5E82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8492C409AA;
	Wed, 27 Sep 2023 19:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8492C409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wwm4rVhpCKo; Wed, 27 Sep 2023 19:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639254227A;
	Wed, 27 Sep 2023 19:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 639254227A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11EF11BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD5B61126
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD5B61126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCF2oK4dIIYO for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A35026144A
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35026144A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91C108264A; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:03:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df78ca175c9bd16200b96ad667d6f99b36acbc7b
X-Git-Newrev: 9e2b91b7ac909065ce4931ad29f46def615413cd
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.91C108264A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/omniorb: bump to version 4.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e2b91b7ac909065ce4931ad29f46def615413cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/omniorb.hash | 8 ++++----
 package/omniorb/omniorb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index f522c1ef67..36db67191d 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0/
-sha1  c3f12c2278f8c4603910c02c8fe892c1dde7217e  omniORB-4.3.0.tar.bz2
-md5  8889ab13b444b495ca2c2b48ea6a6bd7  omniORB-4.3.0.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/
+sha1  b6581c9b6a956c1d442c442767b5a58899a09513  omniORB-4.3.1.tar.bz2
+md5  dc3e4467ef3f457025fedcc6403f8f13  omniORB-4.3.1.tar.bz2
 
 # Locally generated
-sha256  976045a2341f4e9a85068b21f4bd928993292933eeecefea372db09e0219eadd  omniORB-4.3.0.tar.bz2
+sha256  0f42bc3eb737cae680dafa85b3ae3958e9f56a37912c5fb6b875933f8fb7390d  omniORB-4.3.1.tar.bz2
 sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
 sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index d6434735cf..8235fac797 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.3.0
+OMNIORB_VERSION = 4.3.1
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
