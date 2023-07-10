Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AC6EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A965F61007;
	Mon, 10 Jul 2023 16:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A965F61007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apW1JkHlPBjl; Mon, 10 Jul 2023 16:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08A860FE5;
	Mon, 10 Jul 2023 16:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08A860FE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1305D1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14FD81F03
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14FD81F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPYMp0gpYJnK for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:14:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DA2081ECA
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA2081ECA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A70486B1A; Mon, 10 Jul 2023 16:14:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:12:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ca47ce9bdb38f522500e5b5290f75ed09b47bd3
X-Git-Newrev: c19594a10f94c65d52c4996dccc576ca917433d0
X-Patchwork-Hint: ignore
Message-Id: <20230710161411.0A70486B1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: bump to 1.21
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
Content-Type: multipart/mixed; boundary="===============3136259952402396996=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3136259952402396996==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c19594a10f94c65d52c4996dccc576ca917433d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the NOTICE file has changed due to:

 - Update in copyright year

 - Addition of a BSD-2-Clause license, so no change from that perspective

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 94dfa2ed6e..22178d0dec 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851  krb5-1.20.1.tar.gz
+sha256  69f8aaff85484832df67a4bbacd99b9259bd95aab8c651fbbe65cdc9620ea93b  krb5-1.21.tar.gz
 
 # Hash for license file:
-sha256  cfadcf7b2ead2f3af793c25c00638c9908ac0023b101695f40cb9a03b16811dc  NOTICE
+sha256  0d5373486138cb176c063db98274b4c4ab6ef3518c4191360736384b780306c2  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 9bacfaee58..62a34b2379 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION_MAJOR = 1.20
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
+LIBKRB5_VERSION = 1.21
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others

--===============3136259952402396996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3136259952402396996==--
