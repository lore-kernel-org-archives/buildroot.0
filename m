Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA8C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8135A80B97;
	Mon, 19 Aug 2024 11:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEMcfVVm76FA; Mon, 19 Aug 2024 11:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8436580BAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8436580BAA;
	Mon, 19 Aug 2024 11:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3736E1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 268B760684
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuV64jXfqZQT for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53FAE6066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53FAE6066E
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B3C8607C; Mon, 19 Aug 2024 11:10:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:09:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 56574a950b443638949d35d9f6999503291b206b
X-Git-Newrev: 00fdb953e04cb42d02fb6d9942269c3543a44b92
X-Patchwork-Hint: ignore
Message-Id: <20240819111008.41B3C8607C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnftnl: update to
 1.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=00fdb953e04cb42d02fb6d9942269c3543a44b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There is no changelog available, but you can browse the git log
here:
https://git.netfilter.org/libnftnl/log/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnftnl/libnftnl.hash | 4 ++--
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 5d1aad15d1..bd29e76bc3 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,8 +1,8 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
 # Checked pgp signature:
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.6.tar.xz.sig
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.7.tar.xz.sig
 # with key:
 # https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4  libnftnl-1.2.6.tar.xz
+sha256  9122774f968093d5c0bacddd67de480f31fa4073405a7fc058a34b0f387aecb3  libnftnl-1.2.7.tar.xz
 # Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 18be55a17d..65a1431e94 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.6
+LIBNFTNL_VERSION = 1.2.7
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
