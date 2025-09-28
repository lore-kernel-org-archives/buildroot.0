Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F9ACAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1EF80DA6;
	Sun, 28 Sep 2025 10:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcsCZ0oaB7B7; Sun, 28 Sep 2025 10:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 863D780D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863D780D8D;
	Sun, 28 Sep 2025 10:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BD2197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BDE0401A4
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x65ppO9keRlh for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421634019E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 421634019E
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E269865C1; Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 12:17:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 151be15aa8c71cc5c2c4f56019a641b8aa26f6ad
X-Git-Newrev: 546148d5ac76494623fdd0001be41c7fb3431d88
X-Patchwork-Hint: ignore
Message-Id: <20250928101948.3E269865C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: bump to version 1.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=546148d5ac76494623fdd0001be41c7fb3431d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/swaywm/sway/releases/tag/1.11
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sway/sway.hash | 4 ++--
 package/sway/sway.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 379180b0de..46f2bee753 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/swaywm/sway/releases/download/1.10/sway-1.10.tar.gz.sig
+# https://github.com/swaywm/sway/releases/download/1.11/sway-1.11.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  7472a7f11150212e0bed0bd0af9f591c9caac9f9ea87c35486e475a21f5ce81f  sway-1.10.tar.gz
+sha256  0e37a55b7c3379230e97e1ad982542b75016a0c7d6676198604e557f9b373dae  sway-1.11.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 74614b0c7f..f27d147852 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.10
+SWAY_VERSION = 1.11
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
