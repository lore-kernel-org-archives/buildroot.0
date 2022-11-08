Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6BAC4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E35A4174E;
	Tue,  8 Nov 2022 20:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E35A4174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndJkR0colcFt; Tue,  8 Nov 2022 20:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4479641759;
	Tue,  8 Nov 2022 20:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4479641759
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCB711BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A659E4173B
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A659E4173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1L2Pe6ptQBY for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FF7C4032C
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF7C4032C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B57980741; Tue,  8 Nov 2022 20:02:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:01:32 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0eb111baae3046103cf7058e49762342ddc873fb
X-Git-Newrev: dff8703ca251425cdf0d37438c797a970c59659a
X-Patchwork-Hint: ignore
Message-Id: <20221108200212.5B57980741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zsh: security
 bump to version 5.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=dff8703ca251425cdf0d37438c797a970c59659a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Security and bug fix release with several feature additions.

https://zsh.sourceforge.io/releases.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 21531fa31a8cc49054f4af15f8556f4cb08daa7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.hash | 2 +-
 package/zsh/zsh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 5c661ded25..e04aa388d3 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6973520bace600b4779200269b1e5d79e5f505ac4952058c11ad5bbf0dd9919  zsh-5.8.1.tar.xz
+sha256  9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5  zsh-5.9.tar.xz
 sha256  d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c5ab7c2fae..4d46cfe1fa 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSH_VERSION = 5.8.1
+ZSH_VERSION = 5.9
 ZSH_SITE = http://www.zsh.org/pub
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
