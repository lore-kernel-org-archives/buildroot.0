Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4FCC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722EB417AB;
	Mon,  4 Dec 2023 20:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722EB417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsIOyMQjzInv; Mon,  4 Dec 2023 20:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42B241772;
	Mon,  4 Dec 2023 20:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42B241772
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17C5F1BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4432041759
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4432041759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StvNs8nvnw56 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CF5640140
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF5640140
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A103879B7; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:21:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40038a56324cde8cbe9ae8be44f90828498a830f
X-Git-Newrev: 00df26337744aadc64b950a9f75ec84ae602c208
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.7A103879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lualdap: bump to version 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=00df26337744aadc64b950a9f75ec84ae602c208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lualdap/lualdap.hash | 2 +-
 package/lualdap/lualdap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 97aa3b570e..62d8d20abf 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c1772077ebfd02e082e89583701ef27dd348dc76ae015247f21a2756f5fac0ae  lualdap-1.3.1-1.src.rock
+sha256  865b915a3ff16b9663b76a77e89ec54a5028ccfe95e85ad704efbaa144a608f8  lualdap-1.4.0-1.src.rock
 sha256  b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index 375754180f..a6fc612b79 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.3.1-1
+LUALDAP_VERSION = 1.4.0-1
 LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
 LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
