Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11C0C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D30612A1;
	Wed, 23 Apr 2025 19:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQkvq9H6u-O1; Wed, 23 Apr 2025 19:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE22861035
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE22861035;
	Wed, 23 Apr 2025 19:15:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB0019F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A8A261297
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ywkt9PJaNDyc for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 408D46101E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 408D46101E
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:15:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DB6286213; Wed, 23 Apr 2025 19:15:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:12:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70ca62fb499903a17ce0b109909693b9b31054ad
X-Git-Newrev: e7a00fd93a09bbb1adb91e03e1e9ca3a8acec600
X-Patchwork-Hint: ignore
Message-Id: <20250423191542.2DB6286213@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bat:bump to version 0.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7a00fd93a09bbb1adb91e03e1e9ca3a8acec600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/sharkdp/bat/blob/v0.25.0/CHANGELOG.md

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: change changelog url to use tag]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index e80301ff49..f3050f6354 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6  bat-0.24.0-cargo2.tar.gz
+sha256  d793a8f3a6e47b96ee81d624d2b4b470f005b6823ef6b0f38c0cc10726d35fdc  bat-0.25.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index b95cdb25ac..7e89d361af 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.24.0
+BAT_VERSION = 0.25.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
