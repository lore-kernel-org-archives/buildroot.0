Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6DAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EBCA4EE73;
	Mon, 20 Feb 2023 22:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EBCA4EE73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8oclWKLo1kM; Mon, 20 Feb 2023 22:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A13D4F3A5;
	Mon, 20 Feb 2023 22:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A13D4F3A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5571E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0915641715
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0915641715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRBKKoVi8D8H for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A8F841194
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A8F841194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0856F86495; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:04:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a2afdb7b1180bed3b6ad92c22c908805467ead3
X-Git-Newrev: 96d3e5fd2f5310e9f626084669a9ddaa55c92eda
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.0856F86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/capnproto: bump
 version to 0.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=96d3e5fd2f5310e9f626084669a9ddaa55c92eda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The 0.10 line offers minor improvements and bug fixes.

The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
which was also present in 0.10.2, but is fixed within 0.10.3.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/capnproto/capnproto.hash | 2 +-
 package/capnproto/capnproto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index c3233e7c8b..0faf69d069 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
+sha256  e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919  capnproto-0.10.3.tar.gz
 sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 23f128455a..84acf5fc65 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.9.2
+CAPNPROTO_VERSION = 0.10.3
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
