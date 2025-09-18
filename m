Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1CECAC5AA
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B633F827DE;
	Fri, 19 Sep 2025 12:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oyBlt4Y3EvN; Fri, 19 Sep 2025 12:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C55582735
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C55582735;
	Fri, 19 Sep 2025 12:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3504CE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3930540DD4
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUUZRcjT0hQe for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D94140C39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D94140C39
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C08785FD8; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:40:21 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: a788bace2563965c7a70f12a2b213d2338661150
X-Git-Newrev: 3fde9b525be02ad644b8488de5e1924f2777e871
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.5C08785FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/rtl8723ds: bump
 to 2025-09-08 version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fde9b525be02ad644b8488de5e1924f2777e871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This version allows to build with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 09bc23670708db7a2b308ee84ab369c18b7266c5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index d647f9ff28..fa3c472f57 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  97231efcd0e36b8a95c7baf2aa387fd9cf8303ddd66ce463f25c83f9f989e405  rtl8723ds-97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a.tar.gz
+sha256  6cbe12b9ea2b816f52075cbcb402054ecd2cd984852b0da7bc82dfa2baa760e9  rtl8723ds-3ffabeef5e1af54ce3c19ce975ffd0dab731fd73.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 67104fd5d7..e3e020eb7b 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 97d714fdbfc562f71f2e72e5ce6cceb8e2a8be8a
+RTL8723DS_VERSION = 3ffabeef5e1af54ce3c19ce975ffd0dab731fd73
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
