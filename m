Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A5DE6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A97484119;
	Fri,  6 Sep 2024 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTWYOm_m1Dem; Fri,  6 Sep 2024 20:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B49847FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B49847FF;
	Fri,  6 Sep 2024 20:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97D2C1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02E6161128
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGMebfKYIB0L for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22EDB60D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22EDB60D68
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1595886EE3; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:09:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00fdb953e04cb42d02fb6d9942269c3543a44b92
X-Git-Newrev: 9794795401ccf39f6b4ba8a8c2dd81c7aa73ebfc
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.1595886EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: update to 1.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9794795401ccf39f6b4ba8a8c2dd81c7aa73ebfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no changelog available, but you can browse the
git log here:
https://git.netfilter.org/nftables/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index c5ede1130a..ef635cd3c3 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,8 +1,8 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.0.8.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.0.tar.xz.sig
 # with key:
 # https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  9373740de41a82dbc98818e0a46a073faeb8a8d0689fa4fa1a74399c32bf3d50  nftables-1.0.8.tar.xz
+sha256  ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24  nftables-1.1.0.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9cba243372..c958f0eb26 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.8
+NFTABLES_VERSION = 1.1.0
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
