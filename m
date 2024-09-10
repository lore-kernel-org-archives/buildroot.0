Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC93ECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E5E40730;
	Tue, 10 Sep 2024 07:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_CoSEBBqcC2; Tue, 10 Sep 2024 07:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85574408BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85574408BD;
	Tue, 10 Sep 2024 07:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 146FC1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 666B640513
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLQEL9B_VDij for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33A2A4050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A2A4050D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33A2A4050D
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8BFE0009;
 Tue, 10 Sep 2024 07:08:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzP-00HRyY-2e;
 Tue, 10 Sep 2024 09:08:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:53 +0200
Message-Id: <20240910070823.4158894-14-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 13/42] package/bc: fix typos in patch
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
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch         | 2 +-
 .../0002-notice-read-and-write-errors-on-input-and-output.patch | 2 +-
 package/bc/0004-no-gen-libmath.patch                            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
index 03d15f5524..5ff6125f67 100644
--- a/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
+++ b/package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch
@@ -3,7 +3,7 @@ From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 13 Sep 2019 13:45:02 -0500
 Subject: [PATCH] bc: use MAKEINFO variable for docs
 
-Use the appropiate MAKEINFO variable rather than the hardcoded makeinfo
+Use the appropriate MAKEINFO variable rather than the hardcoded makeinfo
 command directly, otherwise missing logic never works.
 
 Fixes:
diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index 87654e3c14..7649ae8c4f 100644
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -16,7 +16,7 @@ Quoting from the bug report:
      were correct.  I _think_ I got them all.  -iwj.
      -- Ian Jackson <iwj@ubuntu.com>  Tue,  4 Apr 2006 17:21:02 +0100
 
-Upsteam:
+Upstream:
 https://sources.debian.org/patches/bc/1.07.1-2/05_notice_read_write_errors.diff/
 
 [Reformatted to GIT for 1.0.7.1 by Matt W]
diff --git a/package/bc/0004-no-gen-libmath.patch b/package/bc/0004-no-gen-libmath.patch
index 7cd506be2c..15b7b9e5a8 100644
--- a/package/bc/0004-no-gen-libmath.patch
+++ b/package/bc/0004-no-gen-libmath.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] no gen libmath
 
 These rules are not cross-friendly so delete them.  libmath has been
 generated offline and included as part of this patch as the fbc tool
-used to generate that header is assuming the cross archtecture and
+used to generate that header is assuming the cross architecture and
 can't execute.
 
 Upstream:
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
