Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CB0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF95A41C13;
	Mon,  6 Dec 2021 18:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJQkoB3JPrPN; Mon,  6 Dec 2021 18:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479B641C73;
	Mon,  6 Dec 2021 18:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ECBE1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7070F41C45
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIdmeIIGRogo for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16BF141C35
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F98F81061; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:52:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5da5e55451d280fac82b97749bbb51f3e5213c6
X-Git-Newrev: 5373215617d5e9747335ec3354207933a4bd9ba5
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.9F98F81061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jsoncpp: bump version to 1.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=5373215617d5e9747335ec3354207933a4bd9ba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updates license hash due to upstream whitespace fixes:
https://github.com/open-source-parsers/jsoncpp/commit/be4a512887e350adc8b1ae19bc2cb81d15c8846f#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Release notes:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jsoncpp/jsoncpp.hash | 4 ++--
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 0070a1874e..99266ae42d 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e34a628a8142643b976c7233ef381457efad79468c67cb1ae0b83a33d7493999  jsoncpp-1.9.4.tar.gz
-sha256  95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  LICENSE
+sha256  f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2  jsoncpp-1.9.5.tar.gz
+sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 829459df4d..e7022bfd39 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.4
+JSONCPP_VERSION = 1.9.5
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
