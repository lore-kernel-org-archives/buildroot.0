Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EA0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D7681BF4;
	Sat, 20 Nov 2021 10:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v616uwVMzSgx; Sat, 20 Nov 2021 10:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0090F81B7B;
	Sat, 20 Nov 2021 10:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D781A1BF420
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C407781B7B
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7euZpy3INXH7 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 10:36:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB10781B58
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 10:36:19 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 27EEB6AAF
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:36:15 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moNjB-2JAQjJ0; Sat, 20 Nov 2021 11:36:13 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moNjB-0002pi-0c
 for buildroot@buildroot.org; Sat, 20 Nov 2021 11:36:13 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:36:13 +0100
Message-Id: <20211120103613.2540099-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637404573-00001449-61EA587F/0/0 CLEAN NORMAL
X-TOI-MSGID: b93d6a19-1995-4fdb-b1cb-1a28f381469c
Subject: [Buildroot] [PATCH/next 1/1] package/ytree: bump version to 2.04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 17d0d24c74..88ca8282bf 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  583aa71552d1347e0eabe39a236fa5a174bf67dde98871853b9fe2a233bcaef1  ytree-2.03.tar.gz
+sha256  6e7a8b7f68efe6d365abe33a1d06d739ad85f22a3d54ddd0aec24a3478d66642  ytree-2.04.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index fdecc0b19b..a64ebe83ed 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.03
+YTREE_VERSION = 2.04
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
