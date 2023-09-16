Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1D6CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3058040A2E;
	Sat, 16 Sep 2023 12:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3058040A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hT0v71mBUeOp; Sat, 16 Sep 2023 12:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6306D40B25;
	Sat, 16 Sep 2023 12:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6306D40B25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9C51BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF3D83A73
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF3D83A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GA-UZfo0R8D for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4292983A59
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4292983A59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3201386881; Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: decd3c7801b294a025437c602fc37e4d5301ae5f
X-Git-Newrev: 0eb397d30e5951e1c49faefb247b0ea98d99eb3e
X-Patchwork-Hint: ignore
Message-Id: <20230916120756.3201386881@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: bump to version 9.4p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eb397d30e5951e1c49faefb247b0ea98d99eb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.openssh.com/txt/release-9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index df472e087d..4060b95e9b 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.3p2
-sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
+# From https://www.openssh.com/txt/release-9.4p1
+sha256  3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85  openssh-9.4p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a2c3f16129..358ef42b6e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.3
-OPENSSH_VERSION_MINOR = p2
+OPENSSH_VERSION_MAJOR = 9.4
+OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
