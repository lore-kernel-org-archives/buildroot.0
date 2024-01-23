Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D10C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4745047203;
	Tue, 23 Jan 2024 21:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4745047203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jH0PdBaGrGcu; Tue, 23 Jan 2024 21:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01FA46E38;
	Tue, 23 Jan 2024 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A01FA46E38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124351BF362
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F13A437EA
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F13A437EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qg3MUKRx3GVK for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C9DD435ED
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C9DD435ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F3186430; Tue, 23 Jan 2024 21:17:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 22:11:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bc29506932c0a3ab1f1c79fa62a1dd75e5132fa
X-Git-Newrev: b4625a19fa976a39c846263c86ad6a18c5537089
X-Patchwork-Hint: ignore
Message-Id: <20240123211722.75F3186430@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hyperfine: bump version to 1.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4625a19fa976a39c846263c86ad6a18c5537089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/sharkdp/hyperfine/blob/master/CHANGELOG.md

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 50cc7694b3..c7e094080a 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  28fcd72c556b4ca2150577217a4d7d51907b7e00ff86b764943d068202a92ace  hyperfine-1.14.0.tar.gz
+sha256  40204671ee8ca73b15c88fcbc6399af0aca69ae9fc45f3ae36487b9c5c07cf48  hyperfine-1.18.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 62246f002e..b9f09a2820 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.14.0
+HYPERFINE_VERSION = 1.18.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
