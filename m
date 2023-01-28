Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1EC27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC63A415FC;
	Sat, 28 Jan 2023 20:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC63A415FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjwndbr-MMFL; Sat, 28 Jan 2023 20:00:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A665741603;
	Sat, 28 Jan 2023 20:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A665741603
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3AF1BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1697941603
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1697941603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo1el3Bwrjyq for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:00:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233BA415FC
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233BA415FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C6C286F82; Sat, 28 Jan 2023 20:00:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:58:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c6f32bd255fc97823d464beacfa905a141066ec
X-Git-Newrev: b83a41ccd8c75caff009a826d938fd74a70a10f3
X-Patchwork-Hint: ignore
Message-Id: <20230128200038.0C6C286F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 d0e88930ddde28ff662503f9f20facf34f7265aa
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

commit: https://git.buildroot.net/buildroot/commit/?id=b83a41ccd8c75caff009a826d938fd74a70a10f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index d00cea4ee0..c655e9931c 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  19a911fdd77af69e48fa50749606a9009696f543cc88e898b4480d8d3c8828f5  luajit-6c4826f12c4d33b8b978004bc681eb1eef2be977.tar.gz
+sha256  aa354d1265814db5a1ee9dfff6049e19b148e1fd818f1ecfa4fcf2b19f6e4dd9  luajit-d0e88930ddde28ff662503f9f20facf34f7265aa.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index c79f18bf62..09bde3590f 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 6c4826f12c4d33b8b978004bc681eb1eef2be977
+LUAJIT_VERSION = d0e88930ddde28ff662503f9f20facf34f7265aa
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
