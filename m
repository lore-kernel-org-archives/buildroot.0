Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4271C021BF
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 11:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7155860F71;
	Wed, 26 Feb 2025 11:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whbv8AoYADb6; Wed, 26 Feb 2025 11:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFAB60F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFAB60F94;
	Wed, 26 Feb 2025 11:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F40E2292
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D26403FA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdWTmArl0h2I for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 11:01:10 +0000 (UTC)
X-Greylist: delayed 468 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Feb 2025 11:01:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D86D40B9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D86D40B9B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D86D40B9B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:01:08 +0000 (UTC)
Received: from wslxew206.ultratronik.de
 (ipb21bd56e.dynamic.kabel-deutschland.de [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 4F00A5247F83;
 Wed, 26 Feb 2025 11:53:18 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Cc: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 26 Feb 2025 11:53:13 +0100
Message-ID: <20250226105313.25330-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: update email address
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Update my email address in the DEVELOPERS file.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73d4281d12..36f8753154 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -183,7 +183,7 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
-N:	Andreas Naumann <ANaumann@ultratronik.de>
+N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
