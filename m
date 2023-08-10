Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D9C001DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9183D40948;
	Thu, 10 Aug 2023 19:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9183D40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZHSLMxYzEFM; Thu, 10 Aug 2023 19:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8239140564;
	Thu, 10 Aug 2023 19:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8239140564
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F412F1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD9EA61037
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9EA61037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luQV-6mj9ND3 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:55:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C236761034
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C236761034
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFD97856A9; Thu, 10 Aug 2023 19:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 21:52:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cf69468751c0343a24d90e626265ef9306036d4
X-Git-Newrev: 7da59a69b1a747671e46ae8a995f323849206c3e
X-Patchwork-Hint: ignore
Message-Id: <20230810195501.AFD97856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uclibc-ng-test: update
 to latest git
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

commit: https://git.buildroot.net/buildroot/commit/?id=7da59a69b1a747671e46ae8a995f323849206c3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- update to latest git version
- switch to https url for better access for users behind a proxy

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 4028bada4c..c4db6ebf83 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  655c9d9732cf24d8230defac7ef4d6bd92ad05c070ab02fe99c1fb47c7a40039  uclibc-ng-test-6790eafe897b3a8c19a2caf50a5ecccf06647adf-br1.tar.gz
+sha256  f261229c43c026e39178aca48f4f3caacd0bbe373ccd06d27954e7a5fa768fe8  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index a678bcf7f0..7d62401244 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 6790eafe897b3a8c19a2caf50a5ecccf06647adf
-UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
+UCLIBC_NG_TEST_VERSION = 0f303c63fab7f4038515ced6f2659242cf60ac19
+UCLIBC_NG_TEST_SITE = https://git.uclibc-ng.org/git/uclibc-ng-test.git
+UCLIBC_NG_TEST_SITE_METHOD = git
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
