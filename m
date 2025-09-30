Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A155CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458C282264;
	Tue, 30 Sep 2025 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-tywGDInzb5; Tue, 30 Sep 2025 19:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6C582268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6C582268;
	Tue, 30 Sep 2025 19:52:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D98A6111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5DC460FE7
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5wZILbf95Ph for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6F160B0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE6F160B0B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:52:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDE5C8661C; Tue, 30 Sep 2025 19:52:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 21:41:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d413ee883f2415e2674bcc7219b3fd7586aff6
X-Git-Newrev: aa8d5d89f75753aba6e9fd9fa6802371cb3c4758
X-Patchwork-Hint: ignore
Message-Id: <20250930195230.DDE5C8661C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump to version 1.8.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa8d5d89f75753aba6e9fd9fa6802371cb3c4758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a change log since 1.8.5, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.10

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/erofs-utils/erofs-utils.hash | 2 +-
 package/erofs-utils/erofs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 04bdd557f8..4e59e55af0 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cd8611270e9c86fe062f647103ca6ada9ed710e4430fdd5960d514777919200d  erofs-utils-1.8.5.tar.gz
+sha256  05eb4edebe11decce6ecb34e98d2f80c8cd283c2f2967d8ba7efd58418570514  erofs-utils-1.8.10.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index bfdcfe58eb..de3c97cbca 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.8.5
+EROFS_UTILS_VERSION = 1.8.10
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
