Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E189CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5F082EB5;
	Wed, 27 Aug 2025 21:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLVCGbbAKfhZ; Wed, 27 Aug 2025 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B7482EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B7482EC7;
	Wed, 27 Aug 2025 21:27:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A938114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05AA182EB5
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5YjZb4KkasA for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 21:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448B482EC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448B482EC7
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3273D87BEA; Wed, 27 Aug 2025 21:27:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 23:26:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 080975a9f48ee63063207034c36987c68f09e54d
X-Git-Newrev: 369518b372c0c1748aa4456dee2f8b8bc8a3052b
X-Patchwork-Hint: ignore
Message-Id: <20250827212725.3273D87BEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nftables: Bump version
 to 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=369518b372c0c1748aa4456dee2f8b8bc8a3052b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 1.1.0, see:
https://git.netfilter.org/nftables/log/?h=v1.1.4

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: add link to git log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nftables/nftables.hash | 5 +++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index ef635cd3c3..b7c65777ca 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,8 +1,9 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.1.0.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sig
 # with key:
 # https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24  nftables-1.1.0.tar.xz
+# https://www.netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sha256sum
+sha256  3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86  nftables-1.1.4.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index f6e6a64efd..94bf977725 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.1.0
+NFTABLES_VERSION = 1.1.4
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
