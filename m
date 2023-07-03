Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C44C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3FA081EDE;
	Mon,  3 Jul 2023 19:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3FA081EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2Pckt6AOAeq; Mon,  3 Jul 2023 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EACF81E89;
	Mon,  3 Jul 2023 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EACF81E89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 794B31BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F3481E89
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F3481E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOw5u8aq2FY4 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E74781D3A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E74781D3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C8D386542; Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:54:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a21733f839478d902f3eab287a82b456e55f708
X-Git-Newrev: 81b25fe881bb771d6510098fd564d1743e289042
X-Patchwork-Hint: ignore
Message-Id: <20230703195633.7C8D386542@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: bump version to 7.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=81b25fe881bb771d6510098fd564d1743e289042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Updated license hash due to upstream commit which update project URLs
and copyright year:
https://sourceforge.net/p/dos2unix/dos2unix/ci/c5acfaf73db3686cf49a46705f00ad8eeb3f7151/
https://sourceforge.net/p/dos2unix/dos2unix/ci/59510e21846bb9c7c2efdf326dd33d573883f611/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index a16c1aecac..032c8ea2d2 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz.asc
-sha256  b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72  dos2unix-7.4.3.tar.gz
-sha256  275ce1371734904b275e83bf760e3e6d2a520614545a3850c9568d1892b940fd  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
+sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
+sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index f16a527f2e..6d1e70cf26 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.3
+DOS2UNIX_VERSION = 7.5.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
