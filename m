Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF35CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B07807ED;
	Mon,  8 Sep 2025 14:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCXlov36qmhy; Mon,  8 Sep 2025 14:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF804807CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF804807CE;
	Mon,  8 Sep 2025 14:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16753CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA6980545
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEaFtEb-JFr2 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F160A80532
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F160A80532
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8E84818B3; Mon,  8 Sep 2025 14:16:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 23:02:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f9ec04c73f0b59eff324c1f23ac036dada3a185
X-Git-Newrev: 080975a9f48ee63063207034c36987c68f09e54d
X-Patchwork-Hint: ignore
Message-Id: <20250908141625.D8E84818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: bump version to 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=080975a9f48ee63063207034c36987c68f09e54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://git.netfilter.org/libnftnl/log/?h=libnftnl-1.3.0

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: add link to git change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnftnl/libnftnl.hash | 5 +++--
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index bd29e76bc3..1182d31fee 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,8 +1,9 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
 # Checked pgp signature:
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.7.tar.xz.sig
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sig
 # with key:
 # https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  9122774f968093d5c0bacddd67de480f31fa4073405a7fc058a34b0f387aecb3  libnftnl-1.2.7.tar.xz
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sha256sum
+sha256  0f4be47a8bb8b77a350ee58cbd4b5fae6260ad486a527706ab15cfe1dd55a3c4  libnftnl-1.3.0.tar.xz
 # Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 65a1431e94..26f112c504 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.7
+LIBNFTNL_VERSION = 1.3.0
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
