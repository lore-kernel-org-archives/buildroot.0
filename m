Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37658ECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F081F4071E;
	Tue, 10 Sep 2024 07:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C37yoIUlXP6; Tue, 10 Sep 2024 07:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED01940B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED01940B7B;
	Tue, 10 Sep 2024 07:09:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52A761BF954
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4039D40399
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mecX08OYuFPO for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A0B94063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0B94063E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0B94063E
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F2534000A;
 Tue, 10 Sep 2024 07:08:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzV-00HS2w-2w;
 Tue, 10 Sep 2024 09:08:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:03 +0200
Message-Id: <20240910070823.4158894-24-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 23/42] package/elftosb: fix typos in patch
 descriptions
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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elftosb/0001-fixes-includes.patch     | 2 +-
 package/elftosb/0002-force-cxx-compiler.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elftosb/0001-fixes-includes.patch b/package/elftosb/0001-fixes-includes.patch
index eaf8ebad98..ba84d126bc 100644
--- a/package/elftosb/0001-fixes-includes.patch
+++ b/package/elftosb/0001-fixes-includes.patch
@@ -1,4 +1,4 @@
-This patch uses system include files instead of a hard coded system path to fixe
+This patch uses system include files instead of a hard coded system path to fix
 potential compilation failure on systems that do not populate system header
 files in /usr/include/..
 
diff --git a/package/elftosb/0002-force-cxx-compiler.patch b/package/elftosb/0002-force-cxx-compiler.patch
index efa92d1171..2dc0394f86 100644
--- a/package/elftosb/0002-force-cxx-compiler.patch
+++ b/package/elftosb/0002-force-cxx-compiler.patch
@@ -19,7 +19,7 @@ Thus, elftosb should either:
 - use gcc and link against libc and libm;
 - or use g++ and link against libstdc++.
 
-Because elftosb is written in C++, this patch implement the sencond option, using
+Because elftosb is written in C++, this patch implement the second option, using
 g++ and linking against libstdc++.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
