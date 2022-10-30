Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50021ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC76760A82;
	Sun, 30 Oct 2022 16:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC76760A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zTq2ze4scQX; Sun, 30 Oct 2022 16:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEDC60A74;
	Sun, 30 Oct 2022 16:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEDC60A74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05D471BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF168812A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF168812A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gE93GAmf_vCw for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BD918126C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD918126C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B1F6875A3; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:20:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9bc980d93a189a16e7320bd254b906c87ca9f87
X-Git-Newrev: 800eef905aac67b2dbd2446c6d011227b473502f
X-Patchwork-Hint: ignore
Message-Id: <20221030162807.1B1F6875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndisc6: bump to version 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=800eef905aac67b2dbd2446c6d011227b473502f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ndisc6: print NAT64 prefix if present.
rdnssd: fix timeout calculation.

https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=d9e87a5307ae7f50355ba2eaac1171c6c4ff9c47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index d76e831208..e258382c53 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  36932f9fc47e2844abcda7550fa1343b3af4b4208dfb61e0c9d9224aad5df351  ndisc6-1.0.5.tar.bz2
+sha256  a713210e9be1f15cfa0809f4c2728b00cd5f25881d7585126986982055453cfb  ndisc6-1.0.6.tar.bz2
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index ff6439e310..23734ca7d7 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.5
+NDISC6_VERSION = 1.0.6
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
