Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8343C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7C1405A2;
	Mon,  5 Feb 2024 18:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7C1405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiazo_rYLKBo; Mon,  5 Feb 2024 18:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C15140556;
	Mon,  5 Feb 2024 18:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C15140556
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5108D1BF379
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A7E341A39
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A7E341A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_YazvIoAMVs for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552A0417EA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552A0417EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E12680E43; Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 19:22:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b64906f88880167cae7513b29b1608f5ca9fe6c6
X-Git-Newrev: c5c3153c6a4c5bd8c4e84624addacc353d1f5724
X-Patchwork-Hint: ignore
Message-Id: <20240205182240.3E12680E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mawk: bump version to
 1.3.4-20240123
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5c3153c6a4c5bd8c4e84624addacc353d1f5724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mawk/mawk.hash | 2 +-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 0a31675ac8..31a74cab60 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,2 @@
-sha256  88f55a632e2736ff5c5f69944abc151734d89d8298d5005921180f39ab7ba6d0  mawk-1.3.4-20230808.tgz
+sha256  a8e319a83744b1f1fb6988dfa189d61887f866e9140cc9a49eb003b2b0655e88  mawk-1.3.4-20240123.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index d747f887ce..9aadf6d972 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20230808
+MAWK_VERSION = 1.3.4-20240123
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
