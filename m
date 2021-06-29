Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE3C4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CB16104F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03CB16104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C799583F4E;
	Wed,  4 Aug 2021 00:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNBmueNE0gSS; Wed,  4 Aug 2021 00:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2B583EF0;
	Wed,  4 Aug 2021 00:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48D9B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47679406B5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-8ahxP15Wqx for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E80404EE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 855BE82926; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:59:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 932f6a0a2adafce9ddecfeb9460d15a5762a85cc
X-Git-Newrev: 9ab8b9cd7ed666b3f4d224e3a1cb58868fc11bbb
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.855BE82926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/portaudio: bump to
 version v190700_20210406
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6349899029135675887=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6349899029135675887==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9ab8b9cd7ed666b3f4d224e3a1cb58868fc11bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Note, that the download URL has changed for the new release.

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
[yann.morin.1998@free.fr: move 'v' out of _VERSION]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/portaudio/portaudio.hash | 2 +-
 package/portaudio/portaudio.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
index 903d760ce0..ba3c506f18 100644
--- a/package/portaudio/portaudio.hash
+++ b/package/portaudio/portaudio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513  pa_stable_v190600_20161030.tgz
+sha256  47efbf42c77c19a05d22e627d42873e991ec0c1357219c0d74ce6a2948cb2def  pa_stable_v190700_20210406.tgz
 sha256  ec52a1952d701f94e5135719a47376da4ee0b4a0201f1cafb49f61db6480ac3d  LICENSE.txt
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 0cf754c7d5..58798dda87 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v190600_20161030
-PORTAUDIO_SITE = http://www.portaudio.com/archives
-PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
+PORTAUDIO_VERSION = 190700_20210406
+PORTAUDIO_SITE = http://files.portaudio.com/archives
+PORTAUDIO_SOURCE = pa_stable_v$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
 PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)

--===============6349899029135675887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6349899029135675887==--
