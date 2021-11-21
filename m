Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5120CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F016D40194;
	Sun, 21 Nov 2021 13:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5vSt-9RCn4E; Sun, 21 Nov 2021 13:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2672F40124;
	Sun, 21 Nov 2021 13:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDCE71BF95F
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB5F840275
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4y4BanY0u73M for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23FB640263
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A2ABE8DC03; Sun, 21 Nov 2021 13:48:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:52:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5da5e55451d280fac82b97749bbb51f3e5213c6
X-Git-Newrev: 5373215617d5e9747335ec3354207933a4bd9ba5
X-Patchwork-Hint: ignore
Message-Id: <20211121134844.A2ABE8DC03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jsoncpp: bump version
 to 1.9.5
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
