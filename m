Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82989C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567C070A22;
	Fri, 28 Feb 2025 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9meHQJXxiOnD; Fri, 28 Feb 2025 17:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 702F0708FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 702F0708FC;
	Fri, 28 Feb 2025 17:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B7E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6110E42F25
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggJvaONPsPxL for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF8542F1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF8542F1F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 665E187B63; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 17:50:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a141b117e0c02a6742ce2df3e28d00df2e364be3
X-Git-Newrev: 8feca04f04789f7e6840a35e1b9298c36569371a
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.665E187B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xz: bump to version
 5.6.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8feca04f04789f7e6840a35e1b9298c36569371a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/tukaani-project/xz/releases/tag/v5.6.4

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index c403ea2be4..5ed714273f 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.4/xz-5.6.4.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  a95a49147b2dbb5487517acc0adcd77f9c2032cf00664eeae352405357d14a6c  xz-5.6.3.tar.bz2
+sha256  176d510c30d80a23b8050bbc048f2ecaacb823ae48b6821727ed6591f0df9200  xz-5.6.4.tar.bz2
 
 # Hash for license files
 sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index b3f8c30026..4a54f93a76 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.6.3
+XZ_VERSION = 5.6.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
