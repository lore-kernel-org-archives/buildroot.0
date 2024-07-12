Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 762244129F;
	Fri, 12 Jul 2024 15:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CuQTMNOgNIJ; Fri, 12 Jul 2024 15:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87B14412A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87B14412A7;
	Fri, 12 Jul 2024 15:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 726971BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E7E484688
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymzBtg9gt5vR for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9519084637
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9519084637
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8397086033; Fri, 12 Jul 2024 15:06:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:06:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a72b3e2eee788ca4b8544ab4f6c0db41065823c6
X-Git-Newrev: 581b4ddd54a4819d5165c0ec3b3ab324927dda92
X-Patchwork-Hint: ignore
Message-Id: <20240712150648.8397086033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc-ng-test: bump to the latest
 git version
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

commit: https://git.buildroot.net/buildroot/commit/?id=581b4ddd54a4819d5165c0ec3b3ab324927dda92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream contains new tests and refactoring of the existing
functionality.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 | 1 +
 package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
 package/uclibc-ng-test/uclibc-ng-test.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0c5cc02d7..ae3a675731 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -853,6 +853,7 @@ F:	package/wireless-regdb/
 N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
 F:	board/qemu/sparc-ss10/
 F:	configs/qemu_sparc_ss10_defconfig
+F:	package/uclibc-ng-test/
 
 N:	Dominik Faessler <faessler@was.ch>
 F:	package/logsurfer/
diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
index dc0499001e..38621062be 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.hash
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f5badc6621eb9dbc9030121bfa6d4d1ccf680a346cd15c6dca05a6e03010d96  uclibc-ng-test-0f303c63fab7f4038515ced6f2659242cf60ac19-git4.tar.gz
+sha256  fae9be86b0eb050e139047d934e7e02599d074d481523dead65ce164c8453500  uclibc-ng-test-132c6134d69146bcafbdda68ae3a9cbd9f8fb921-git4.tar.gz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 7d62401244..a80b64349b 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 0f303c63fab7f4038515ced6f2659242cf60ac19
+UCLIBC_NG_TEST_VERSION = 132c6134d69146bcafbdda68ae3a9cbd9f8fb921
 UCLIBC_NG_TEST_SITE = https://git.uclibc-ng.org/git/uclibc-ng-test.git
 UCLIBC_NG_TEST_SITE_METHOD = git
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
