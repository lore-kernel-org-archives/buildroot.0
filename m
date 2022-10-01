Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A78DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9ECB83F85;
	Sat,  1 Oct 2022 16:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9ECB83F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDngKRDKiL9z; Sat,  1 Oct 2022 16:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0211D83F6D;
	Sat,  1 Oct 2022 16:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0211D83F6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B45CB1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EB6641932
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB6641932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVcQuqrfKIwo for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:31:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A183741695
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A183741695
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 896F48643D; Sat,  1 Oct 2022 16:31:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:30:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60f97ad95ad2ec93effed8a41e7d2e6101cd6917
X-Git-Newrev: e65d768dbc41912451eaebf7f111541a672ba98c
X-Patchwork-Hint: ignore
Message-Id: <20221001163107.896F48643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to version 1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e65d768dbc41912451eaebf7f111541a672ba98c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes[1] on GitHub for changes.

[1] https://github.com/rauc/rauc/releases/tag/v1.8

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rauc/rauc.hash | 5 ++---
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 677d358158..8351d0266e 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,3 @@
-# Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
-sha256  8b7d37cc1eb57df4f03de3c943dd7be290b78d47be28881e8b1f070e1d5e55df  rauc-1.7.tar.xz
+# Locally calculated
+sha256  d233247c1763b1c56c851d0adef2094b7aa2fcd72decf524a8ac0419188e0978  rauc-1.8.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 8bfb0b79ba..0c81a6cc35 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.7
+RAUC_VERSION = 1.8
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
