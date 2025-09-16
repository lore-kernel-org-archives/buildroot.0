Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209ABCAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5AEF8336D;
	Tue, 16 Sep 2025 20:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flg3kkZe4yTL; Tue, 16 Sep 2025 20:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07345832C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07345832C9;
	Tue, 16 Sep 2025 20:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1374812D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021D341207
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fnugn603oICs for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A7641206
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A7641206
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 566D384BC8; Tue, 16 Sep 2025 20:17:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:09:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f57fa3ff92f62244bc17386b27e76421759f50c
X-Git-Newrev: d9792fa4e6181b50e764b31f22fca5049df43f64
X-Patchwork-Hint: ignore
Message-Id: <20250916201752.566D384BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zoxide: bump to version 0.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9792fa4e6181b50e764b31f22fca5049df43f64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.8

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zoxide/zoxide.hash | 2 +-
 package/zoxide/zoxide.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index c6648b94d9..64c1efd277 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06c7c697582252a8b54f8bd32d77603d3c2f107b8d1e9adee7751dfd31ebfe76  zoxide-0.9.6-cargo4.tar.gz
+sha256  728fbe4e44cb9b4b8bb0753e962e2889619cccdc354ac141d6e26eb2ca8ee9b9  zoxide-0.9.8-cargo4.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
index bd9a7e2acd..870fc12a2c 100644
--- a/package/zoxide/zoxide.mk
+++ b/package/zoxide/zoxide.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZOXIDE_VERSION = 0.9.6
+ZOXIDE_VERSION = 0.9.8
 ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
 ZOXIDE_LICENSE = MIT
 ZOXIDE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
