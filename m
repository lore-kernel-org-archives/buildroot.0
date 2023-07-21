Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3825C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EC1E402A7;
	Fri, 21 Jul 2023 21:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC1E402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wjy358gu1PKS; Fri, 21 Jul 2023 21:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E71941892;
	Fri, 21 Jul 2023 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E71941892
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A18B1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6077541895
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6077541895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oG1fwB2fIQ3P for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3397A41872
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3397A41872
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D27087536; Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:12:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c97f3fc0b352104eb1a2725e5b2e81b00ab3ad4
X-Git-Newrev: c7aaeff4f1b1239de98304badb8d5d9b48feaced
X-Patchwork-Hint: ignore
Message-Id: <20230721211905.1D27087536@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7aaeff4f1b1239de98304badb8d5d9b48feaced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index c655e9931c..049f8c2fc2 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aa354d1265814db5a1ee9dfff6049e19b148e1fd818f1ecfa4fcf2b19f6e4dd9  luajit-d0e88930ddde28ff662503f9f20facf34f7265aa.tar.gz
+sha256  835035b244c3dc3d3d19bdd5ac623af90b84207e6330fb78f9fa51d6e200d760  luajit-8635cbabf3094c4d8bd00578c7d812bea87bb2d3.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 09bde3590f..2a27aa5056 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = d0e88930ddde28ff662503f9f20facf34f7265aa
+LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
