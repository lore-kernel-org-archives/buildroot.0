Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9981CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABFC84A0A;
	Fri, 28 Feb 2025 16:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNle7Eque46a; Fri, 28 Feb 2025 16:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D5AB84A0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5AB84A0B;
	Fri, 28 Feb 2025 16:47:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C40968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2314841A2F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eVgk9ZmAI7B for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE5A41809
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CE5A41809
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2139184777; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:05:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c28e089579e132a0676506af65a1a996c92def7b
X-Git-Newrev: a2c6b8921cfa9bf0eb3667922de37fe7079a8d5b
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.2139184777@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luadbi-sqlite3: bump
 to version 0.7.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2c6b8921cfa9bf0eb3667922de37fe7079a8d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luadbi-sqlite3/luadbi-sqlite3.hash | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 4096fbb26a..96f083dcb8 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c5b043db43941a3c6e43d3e3699236846ed6d03a6c4cb12fa1a497f965138d9f  luadbi-sqlite3-0.7.2-1.src.rock
+sha256  ab4b0b47614aa26c143da0e164476779bfdd406d263e0c4184a97d59f0430cdf  luadbi-sqlite3-0.7.3-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index 4ae2b5cf38..ea01671605 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_SQLITE3_VERSION = 0.7.2-1
+LUADBI_SQLITE3_VERSION = 0.7.3-1
 LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
