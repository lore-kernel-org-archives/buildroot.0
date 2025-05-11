Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026CC3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 03:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242F68222D;
	Sun, 11 May 2025 03:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_hQzGBdDaNU; Sun, 11 May 2025 03:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6407482238
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6407482238;
	Sun, 11 May 2025 03:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id D8803E0
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id C9EF68222D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 8o-ICNXJnoD3 for <buildroot@buildroot.org>;
 Sun, 11 May 2025 03:04:42 +0000 (UTC)
X-Greylist: delayed 313 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 11 May 2025 03:04:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A856E8222B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A856E8222B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.30.189.100;
 helo=iodev.co.uk; envelope-from=ismael@iodev.co.uk; receiver=<UNKNOWN> 
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id A856E8222B
 for <buildroot@buildroot.org>; Sun, 11 May 2025 03:04:41 +0000 (UTC)
Received: from localhost (109.red-83-50-135.dynamicip.rima-tde.net
 [83.50.135.109])
 by iodev.co.uk (Postfix) with UTF8SMTPSA id 7D8CC40A3AF;
 Sun, 11 May 2025 04:59:27 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Cc: Ismael Luceno <ismael@iodev.co.uk>
Date: Sun, 11 May 2025 04:59:19 +0200
Message-ID: <20250511025920.8527-2-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=iodev.co.uk
Subject: [Buildroot] [PATCH] package/mawk: bump version to 1.3.4-20250131
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

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/mawk/mawk.hash | 2 +-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 3dc2359c82ad..7f81c93a3a17 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,2 @@
-sha256  a39967927dfa1b0116efc45b944a0f5b5b4c34f8e842a4b223dcdd7b367399e0  mawk-1.3.4-20240905.tgz
+sha256  51bcb82d577b141d896d9d9c3077d7aaa209490132e9f2b9573ba8511b3835be  mawk-1.3.4-20250131.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index 1a5e80ae8e57..f9f062390475 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20240905
+MAWK_VERSION = 1.3.4-20250131
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
