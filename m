Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48FFCAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C02483231;
	Tue, 16 Sep 2025 20:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J13mcIZ0ZEY0; Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B093B83381
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B093B83381;
	Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F97912D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B22241206
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWRjaFp7ijFR for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF3141205
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DF3141205
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2B784BC6; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b32fdc6c567bd704abd4ba9d5711eaa26a669f8
X-Git-Newrev: 7f57fa3ff92f62244bc17386b27e76421759f50c
X-Patchwork-Hint: ignore
Message-Id: <20250916201752.4D2B784BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fd: bump to version 10.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f57fa3ff92f62244bc17386b27e76421759f50c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/sharkdp/fd/releases/tag/v10.3.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fd/fd.hash | 2 +-
 package/fd/fd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 5cad89cf31..991be349b8 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  aeb949d3ab62960ebc4ff9c1b2d06065de9727c270f36020b8d95328d762688a  fd-10.2.0-cargo4.tar.gz
+sha256  4a32dbd98dab4faf307954bf854d0c0c5719816e1cd28fe49385b6925cc8c515  fd-10.3.0-cargo4.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
index 9b6b305e77..c390b5221c 100644
--- a/package/fd/fd.mk
+++ b/package/fd/fd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FD_VERSION = 10.2.0
+FD_VERSION = 10.3.0
 FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
 FD_LICENSE = Apache-2.0 or MIT
 FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
