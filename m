Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D896CCA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 23:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 672A840D07;
	Fri, 22 Aug 2025 23:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZmnluWQNy-W; Fri, 22 Aug 2025 23:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CB940C79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CB940C79;
	Fri, 22 Aug 2025 23:57:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C51A6A
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 23:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4D883DC5
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 23:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCbS5b7mQ6EW for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 23:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB0DF83DC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB0DF83DC3
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 23:57:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5BA2878DB; Fri, 22 Aug 2025 23:57:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 01:56:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ca70913684eed045d10a22328d483264852ac7bf
X-Git-Newrev: 59738c89c2623d42904ea7bed85eda6600d21110
X-Patchwork-Hint: ignore
Message-Id: <20250822235725.A5BA2878DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qoriq-rcw: bump to
 version lf-6.12.20-2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59738c89c2623d42904ea7bed85eda6600d21110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The commit we were previously on, 45e6925, was the head of the master
branch and now became tag lf-6.12.20-2.0.0, which we can use as is.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 35e39efd1f..1bdd38446d 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f99ef0620dc49c6a0b9d03958cdb8a3e559907351fccd4814fd37b80d1324e97  qoriq-rcw-lf-6.12.3-1.0.0-2-g45e6925.tar.gz
+sha256  cf1caf7f45989025f8564c5edd9c98650082ebb2d091239292d3db8d75522164  qoriq-rcw-lf-6.12.20-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 512c4ce491..35602e41e4 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.3-1.0.0-2-g45e6925
+QORIQ_RCW_VERSION = lf-6.12.20-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
