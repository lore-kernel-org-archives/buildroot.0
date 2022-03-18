Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD533C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 09:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6507C80DAD;
	Fri, 18 Mar 2022 09:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6JkzCBP4z-z; Fri, 18 Mar 2022 09:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D3F80C02;
	Fri, 18 Mar 2022 09:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBA01BF228
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 09:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89DFA60706
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 09:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=protonmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOWU4zndRCx9 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 09:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C845B60BCD
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 09:03:43 +0000 (UTC)
Date: Fri, 18 Mar 2022 09:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1647594221;
 bh=AumFYkjvnE3JQCD9b8qI1jsLeL6vH3bf10pP5ewADvo=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=YHbJAd8iF1Og+pjeZzhZ+mg6qXmQyyhkmwtd704xMekJTP+nsyw1wTaAqiLzlmqMA
 joBo9RFJuVNQAcrR6iD7odHLAapJe3IHlcO/WJBYwX7R/Ap0f+GakilyP9zrIqZ0F8
 RnSUIOfaCY7w7TPXU00d9Oendf8BFpWecfgjCvR8OOMErTGLW/oWUQ9S5gSvuKMYYl
 WgeuymesPi8WErL/YT2eECI+JoE9uBWE/gT7+VKsEoy+aSQrEFuaBL0JcOEu/MUjIu
 ytqGITbAq8grmfhQksI3SNBJh0EG5dpv2jmubUPtNQl2KEFNv3LZqgC+u34XluIYLL
 zn7xns5E67KrQ==
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <m8NCoWfElcFVVs6rJ5aCIPGaUztk0BOtLtImkjPWh0hVSsTMeKi8UxpeX71YI_AuRCYpynLSeSrBZ6avQPcmu9iqPseHAKLKLSzRq2_0lx8=@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: bump version to 3.2.0
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index b6eb3c1f97..db6b3b7ad0 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8  tpm2-tss-3.1.0.tar.gz
+sha256  48305e4144dcf6d10f3b25b7bccf0189fd2d1186feafd8cd68c6b17ecf0d7912  tpm2-tss-3.2.0.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 060883c377..568ac35c8f 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TPM2_TSS_VERSION = 3.1.0
+TPM2_TSS_VERSION = 3.2.0
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
--
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
