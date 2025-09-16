Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A2CCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F79161136;
	Tue, 16 Sep 2025 20:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWyPTf6XxcLZ; Tue, 16 Sep 2025 20:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBE66112B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBE66112B;
	Tue, 16 Sep 2025 20:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 147677AB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0667F41756
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Cpt3KV81mq5 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4983C400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4983C400F9
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 434C684BC1; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:09:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b2191cff514e9b9397aba520588d22269e3ad99
X-Git-Newrev: 5b32fdc6c567bd704abd4ba9d5711eaa26a669f8
X-Patchwork-Hint: ignore
Message-Id: <20250916201752.434C684BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eza: bump to version 0.23.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b32fdc6c567bd704abd4ba9d5711eaa26a669f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.23.3

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 3b632f92d4..0bc5061ab1 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12c47fc9c73450dca05b6e34f928ad13e2cbb59434a915be0d47fa5635df2cf5  eza-0.20.19-cargo4.tar.gz
+sha256  d31a17b4733589da761ad79bc9faf4271b358a0ef9fea19dabb5f38827ba7cf4  eza-0.23.3-cargo4.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index cd19c4b4d6..6a0c12cf9f 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.20.19
+EZA_VERSION = 0.23.3
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = EUPL-1.2
 EZA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
