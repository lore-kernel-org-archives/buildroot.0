Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74CCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D492D40B56;
	Tue, 30 Sep 2025 19:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sANF1VSlHFby; Tue, 30 Sep 2025 19:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0540E40D3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0540E40D3B;
	Tue, 30 Sep 2025 19:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF232A6
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5278240234
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAyCb6cKLxR9 for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE23E40C6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE23E40C6A
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E89B886629; Tue, 30 Sep 2025 19:57:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 21:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa8d5d89f75753aba6e9fd9fa6802371cb3c4758
X-Git-Newrev: 78a8491d81f10c4ed19c12f3b29b64af1db1b843
X-Patchwork-Hint: ignore
Message-Id: <20250930195750.E89B886629@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uefisettings: bump to version
 149bc92970949d44be641ae1e3e942220d7390e7
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

commit: https://git.buildroot.net/buildroot/commit/?id=78a8491d81f10c4ed19c12f3b29b64af1db1b843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change list, see:
https://github.com/linuxboot/uefisettings/compare/f90aed759b9c2217bea336e37ab5282616ece390...149bc92970949d44be641ae1e3e942220d7390e7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to change list]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uefisettings/uefisettings.hash | 2 +-
 package/uefisettings/uefisettings.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index eb1a4f5edc..b9b5222d4b 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  846eb9b3efe09f6584a2c08f70a291b3733066f832008b935f010336cbe5e0b9  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo4.tar.gz
+sha256  3c199e92e9dde29d5a1be33994cef27eb9450f1dbc006eb5e09856e2be7f172b  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo4.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/uefisettings/uefisettings.mk b/package/uefisettings/uefisettings.mk
index 0559b1c504..2a11baa74d 100644
--- a/package/uefisettings/uefisettings.mk
+++ b/package/uefisettings/uefisettings.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UEFISETTINGS_VERSION = f90aed759b9c2217bea336e37ab5282616ece390
+UEFISETTINGS_VERSION = 149bc92970949d44be641ae1e3e942220d7390e7
 UEFISETTINGS_SITE = $(call github,linuxboot,uefisettings,$(UEFISETTINGS_VERSION))
 UEFISETTINGS_LICENSE = BSD-3-Clause
 UEFISETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
