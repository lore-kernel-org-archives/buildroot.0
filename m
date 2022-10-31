Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF28FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD88460B38;
	Mon, 31 Oct 2022 09:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD88460B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kxX4tiQT1gn; Mon, 31 Oct 2022 09:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA26160B26;
	Mon, 31 Oct 2022 09:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA26160B26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 989A31BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E584024F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E584024F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usiuHKV_WoKd for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:24:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94CD940256
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94CD940256
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AD5D8371C; Mon, 31 Oct 2022 09:24:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:20:59 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b44e2cf19a1f8f19e228019f320921fd06834f01
X-Git-Newrev: d0f071e3731b4c94f8c2c7d190e9eac101ed0e07
X-Patchwork-Hint: ignore
Message-Id: <20221031092441.5AD5D8371C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/uclibc-ng-test:
 update to latest git
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0f071e3731b4c94f8c2c7d190e9eac101ed0e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes a musl autobuild compile error, see
http://autobuild.buildroot.net/results/3cbd6f8007d1b5276b91e9f1688402f86b1f2049/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 616347a163a940f78300d980353e831a39095f3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index 37660b04c3..4028bada4c 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f731307c0547ce4bbd3f5025972f64e9b22208a147e34e5745000b54d4d3aa98  uclibc-ng-test-0844445e7358eb10e716155b55b0fb23e88d644a-br1.tar.gz
+sha256  655c9d9732cf24d8230defac7ef4d6bd92ad05c070ab02fe99c1fb47c7a40039  uclibc-ng-test-6790eafe897b3a8c19a2caf50a5ecccf06647adf-br1.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 6a658b4293..a678bcf7f0 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 0844445e7358eb10e716155b55b0fb23e88d644a
+UCLIBC_NG_TEST_VERSION = 6790eafe897b3a8c19a2caf50a5ecccf06647adf
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
