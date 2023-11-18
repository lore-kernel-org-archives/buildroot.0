Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CDC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD26640981;
	Sat, 18 Nov 2023 14:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD26640981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqTr1BPB9GnN; Sat, 18 Nov 2023 14:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74CA4171B;
	Sat, 18 Nov 2023 14:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74CA4171B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6909C1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B21403C4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B21403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYKqvsfWb54B for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC4F400DD
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC4F400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24FAA86EA2; Sat, 18 Nov 2023 14:00:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 14:57:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 986a160cbe5c492acfda9bbf2048b1501d570072
X-Git-Newrev: 1cb0853489b8b908c56ff7e770aa940b5ed992ec
X-Patchwork-Hint: ignore
Message-Id: <20231118140005.24FAA86EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/procs: bump to version
 0.14.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cb0853489b8b908c56ff7e770aa940b5ed992ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/dalance/procs/releases/tag/v0.14.3

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/procs/procs.hash | 2 +-
 package/procs/procs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 1c2fb5c3d5..19832e3897 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  643b7ba4b769ee9f336d441ecdac779c3d52e5719a15c14bb0acb3609ce1cd99  procs-0.14.0.tar.gz
+sha256  2f9fdbcf7324952e22565ded58148fa40387b5a5f8723996620d6c4588925713  procs-0.14.3.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/procs/procs.mk b/package/procs/procs.mk
index a074ee1311..8567bf3da3 100644
--- a/package/procs/procs.mk
+++ b/package/procs/procs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCS_VERSION = 0.14.0
+PROCS_VERSION = 0.14.3
 PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
 PROCS_LICENSE = MIT
 PROCS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
