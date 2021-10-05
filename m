Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:52:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A7761215
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1A7761215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA85F60BEA;
	Tue,  5 Oct 2021 14:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNiSevmMOA3a; Tue,  5 Oct 2021 14:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B64D60BDE;
	Tue,  5 Oct 2021 14:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE9D1BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D06940297
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vPNFJU2b5ou for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6189240200
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:51:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9087790C88; Tue,  5 Oct 2021 14:49:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 16:51:13 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b5fd0bbbad9854f1fd3533a86ec8cea35a0db8d8
X-Git-Newrev: 5c34831662766d6e6a27f5b05c1191ff2ddd16d6
X-Patchwork-Hint: ignore
Message-Id: <20211005144923.9087790C88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/cryptopp: bump to
 version 8.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c34831662766d6e6a27f5b05c1191ff2ddd16d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://www.cryptopp.com/release850.html
https://www.cryptopp.com/release840.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 251f3e3a3f16ea91565ddcafd063d4ad1b86549b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 2774dc70ec..404d8a41ae 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release830.html:
-sha512  ad5219a66c5924d330d3646d0ff996dd235006f6812074bc4eb9e8c662a4f000ba20449d377f24b133d19ce682f7b2a3b2eb4c08857ce0f5bb39743d1d425147  cryptopp830.zip
+# Hash from: https://www.cryptopp.com/release850.html:
+sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
 
 # Hash for license file:
 sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 1706108454..1d303a67a0 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.3.0
+CRYPTOPP_VERSION = 8.5.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
