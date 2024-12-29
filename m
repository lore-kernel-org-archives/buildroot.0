Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE281C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBAB848B1;
	Fri, 28 Feb 2025 16:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyVr4Tsekex8; Fri, 28 Feb 2025 16:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABED8498E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABED8498E;
	Fri, 28 Feb 2025 16:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1254A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0F142E12
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDQJdiV1hbDn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190984258F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 190984258F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DD0F82215; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:05:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a649794913214c27960f704d62f2f3577fef7cb7
X-Git-Newrev: c28e089579e132a0676506af65a1a996c92def7b
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.0DD0F82215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luadbi: bump to
 version 0.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c28e089579e132a0676506af65a1a996c92def7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luadbi/luadbi.hash | 2 +-
 package/luadbi/luadbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index e142f5e62e..992de9571f 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  9ebbbaf4ea1f48628341e9ff3c1de10a57200c02453734f41b8016b0fc7b4956  luadbi-0.7.2-1.src.rock
+sha256  b1b6abd58a7b9cb51ccf67be903d5cbace9721c35dbf799379ffd57f45b40f12  luadbi-0.7.3-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index fbae6b319c..6f617fdc2b 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_VERSION = 0.7.2-1
+LUADBI_VERSION = 0.7.3-1
 LUADBI_SUBDIR = luadbi
 LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
