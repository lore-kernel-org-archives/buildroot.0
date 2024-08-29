Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E1C83030
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 10:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B9F419A0;
	Thu, 29 Aug 2024 10:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeAGYDNUZXq7; Thu, 29 Aug 2024 10:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA0941995
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA0941995;
	Thu, 29 Aug 2024 10:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A96FA1BF365
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 10:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E589581A12
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 10:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zp6I_6Bzi9NN for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 10:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC22981467
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC22981467
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 10:21:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA32D8665F; Thu, 29 Aug 2024 10:21:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 12:09:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ae32afab9b234a78d9b3a4015ea733c53e5d05b9
X-Git-Newrev: fdbbe21c87e69835418b046b11cc876dbea58556
X-Patchwork-Hint: ignore
Message-Id: <20240829102101.CA32D8665F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libupnp: bump to
 version 1.4.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdbbe21c87e69835418b046b11cc876dbea58556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

https://github.com/pupnp/pupnp/blob/release-1.14.19/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a4bd98d11550081db622327fd8cab570c0ad077)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 6fd4678c0d..86437a7339 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  16a7cee93ce2868ae63ab1a8164dc7de43577c59983b9f61293a310d6888dceb  libupnp-1.14.18.tar.bz2
+sha256  b6423c573b758d09539f5e6c4712c1a9fd35dccf835f81d99473d50a50ad49b0  libupnp-1.14.19.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 61e52c095a..cd148d14d0 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.18
+LIBUPNP_VERSION = 1.14.19
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
