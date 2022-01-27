Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B26FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1BB84E45;
	Thu, 27 Jan 2022 19:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLp8x4RX1hVB; Thu, 27 Jan 2022 19:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65BA584E21;
	Thu, 27 Jan 2022 19:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABA551C113E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9974360B7A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrdHOKODwa7A for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF2D360B79
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:27:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8695B82A00; Thu, 27 Jan 2022 19:20:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 20:27:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b630df6fb24ec7f79564bea5fd6d0154268a6ed3
X-Git-Newrev: f791221c8616bfa6d338ce6c287353395cc2c61a
X-Patchwork-Hint: ignore
Message-Id: <20220127192022.8695B82A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: bump to version 2.0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=f791221c8616bfa6d338ce6c287353395cc2c61a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jasper-software/jasper/blob/version-2.0.33/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 67653a8e88..410bcfc683 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
+sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.33.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 59c5b3d66a..05168db763 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.28
-JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
+JASPER_VERSION = 2.0.33
+JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
 JASPER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
