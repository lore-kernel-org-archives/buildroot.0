Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B0CCCF9E5
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB3D81332;
	Sat, 25 Oct 2025 22:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v64m4NKRJs-T; Sat, 25 Oct 2025 22:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174F081334
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174F081334;
	Sat, 25 Oct 2025 22:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2284C976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1822C402B8
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XL4wW9obtU9f for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705D740245
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705D740245
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B44F878CF; Sat, 25 Oct 2025 22:07:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 00:06:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0268d7deeccc4bdfe0a334c2e480cd2fb9e2f1dc
X-Git-Newrev: 2335d37b14bc60d2600cf4f1af68ec9b0ae891fc
X-Patchwork-Hint: ignore
Message-Id: <20251025220740.6B44F878CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libucontext: bump version to 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2335d37b14bc60d2600cf4f1af68ec9b0ae891fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kaniini/libucontext/blob/libucontext-1.3.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libucontext/libucontext.hash | 2 +-
 package/libucontext/libucontext.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libucontext/libucontext.hash b/package/libucontext/libucontext.hash
index a8e1e23e36..dc6ef3dfb1 100644
--- a/package/libucontext/libucontext.hash
+++ b/package/libucontext/libucontext.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3  libucontext-1.2.tar.gz
+sha256  06fca63bc00a236ea7e2ce4fe984d7203b1f9ea046f5c8c815d280da4ea281e3  libucontext-1.3.3.tar.gz
 # License files, locally calculated
 sha256  ecf4be354bbb6ccebdf150d1a8f2b3caeb10cf7c8a580f278a30799372f9e037  LICENSE
diff --git a/package/libucontext/libucontext.mk b/package/libucontext/libucontext.mk
index 75c4f9b9e4..64ffa2ec37 100644
--- a/package/libucontext/libucontext.mk
+++ b/package/libucontext/libucontext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCONTEXT_VERSION = 1.2
+LIBUCONTEXT_VERSION = 1.3.3
 LIBUCONTEXT_SITE = $(call github,kaniini,libucontext,libucontext-$(LIBUCONTEXT_VERSION))
 LIBUCONTEXT_LICENSE = ISC
 LIBUCONTEXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
