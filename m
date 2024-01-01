Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70728C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2371D4168A;
	Mon,  1 Jan 2024 21:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2371D4168A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwUnPq9M0yIp; Mon,  1 Jan 2024 21:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 320F5408E6;
	Mon,  1 Jan 2024 21:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 320F5408E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5160D1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5920441C4E
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5920441C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l9Tg2t7uuk3 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1CD41BA8
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1CD41BA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A7E683B63; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:15:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e26e9e5aa7604aafbe0197c91b7e3f59a2585c2
X-Git-Newrev: 292bb525c7957324c6eed3eaa56a61aed9cbcb16
X-Patchwork-Hint: ignore
Message-Id: <20240101211802.1A7E683B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scrypt: bump to version 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=292bb525c7957324c6eed3eaa56a61aed9cbcb16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYRIGHT (update in year:
https://github.com/Tarsnap/scrypt/commit/c6e440c4f51eeb4aaf5e490734f46cdb06f4b4c8)

https://github.com/Tarsnap/scrypt/compare/1.3.1...1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scrypt/scrypt.hash | 6 +++---
 package/scrypt/scrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index 4004b89737..fb78909b3f 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1,4 +1,4 @@
-# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.1.asc
-sha256  df2f23197c9589963267f85f9c5307ecf2b35a98b83a551bf1b1fb7a4d06d4c2  scrypt-1.3.1.tgz
+# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.2.asc
+sha256  d632c1193420ac6faebf9482e65e33d3a5664eccd643b09a509d21d1c1f29be2  scrypt-1.3.2.tgz
 # Locally computed
-sha256  1fb4da0e9000287414066a238f378528d5652f89b72b4a1d6b89fdd20031b22d  COPYRIGHT
+sha256  277ba0da6001b6c53c1da3f0d0d9107cf847eed49280e2cf4ca1421b8f707119  COPYRIGHT
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index fb305faf41..977045b8e6 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCRYPT_VERSION = 1.3.1
+SCRYPT_VERSION = 1.3.2
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
 SCRYPT_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
