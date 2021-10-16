Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE8AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6274861250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6274861250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCD1404E4;
	Sat, 16 Oct 2021 08:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKRsNL0ix7aE; Sat, 16 Oct 2021 08:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A0C4066B;
	Sat, 16 Oct 2021 08:30:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 373061BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD2DA40486
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACehGStwFwx3 for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B286404B5
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 75C0295C5A; Sat, 16 Oct 2021 08:26:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:26:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e02ab755e1906f7bdd379ccaa357b0d6359861
X-Git-Newrev: c99f6b8d1e1e0402fcf314af894ff6aedb1707fb
X-Patchwork-Hint: ignore
Message-Id: <20211016082647.75C0295C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davici: bump to version 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c99f6b8d1e1e0402fcf314af894ff6aedb1707fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/strongswan/davici/blob/v1.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/davici/davici.hash | 4 ++--
 package/davici/davici.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davici/davici.hash b/package/davici/davici.hash
index 178d87f2e2..27ec2a6dab 100644
--- a/package/davici/davici.hash
+++ b/package/davici/davici.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-1.3.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  b03c5a1aad905e962271d70246d6af6c337ffd00449d990082ea02161327bde8  davici-1.4.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/davici/davici.mk b/package/davici/davici.mk
index 6c8df48b6a..d54e02e278 100644
--- a/package/davici/davici.mk
+++ b/package/davici/davici.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVICI_VERSION = 1.3
+DAVICI_VERSION = 1.4
 DAVICI_SITE = $(call github,strongswan,davici,v$(DAVICI_VERSION))
 DAVICI_LICENSE = LGPL-2.1+
 DAVICI_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
