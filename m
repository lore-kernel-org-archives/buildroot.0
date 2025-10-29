Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125B0CCF9F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 21:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FA261136;
	Wed, 29 Oct 2025 21:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9qPLKi292JP; Wed, 29 Oct 2025 21:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A9D6110F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A9D6110F;
	Wed, 29 Oct 2025 21:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E98E1707
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D009840905
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIg6aSX-Vvrs for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 21:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017E64075D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 017E64075D
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:37:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFB04879B7; Wed, 29 Oct 2025 21:37:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Oct 2025 21:47:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f12ba4580a8b8621fa6ae75551365c8493473618
X-Git-Newrev: 029b672ebe20022a082efe87aef569ca07092c6b
X-Patchwork-Hint: ignore
Message-Id: <20251029213752.EFB04879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: bump to version 8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=029b672ebe20022a082efe87aef569ca07092c6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/avrdudes/avrdude/blob/v8.1/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 2a11968eb5..995dad3782 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a689d70a826e2aa91538342c46c77be1987ba5feb9f7dab2606b8dae5d2a52d5  avrdude-8.0.tar.gz
+sha256  2d3016edd5281ea09627c20b865e605d4f5354fe98f269ce20522a5b910ab399  avrdude-8.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 6f19e68341..8f451a7fdb 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 8.0
+AVRDUDE_VERSION = 8.1
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
