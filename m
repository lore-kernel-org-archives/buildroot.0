Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFDECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4307740393;
	Sun, 23 Oct 2022 17:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4307740393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSbJ1tRSXgCu; Sun, 23 Oct 2022 17:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775AB4038B;
	Sun, 23 Oct 2022 17:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775AB4038B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABA821BF95E
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86FBC81445
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 17:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86FBC81445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9SfrXVeuBZar for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD70B8143A
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD70B8143A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9973786EC4; Sun, 23 Oct 2022 17:26:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 19:20:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d948e1b34e4e6e199111feb29803d14dbfc120b
X-Git-Newrev: 68e1b602dab1e08dc7c494cfdfeece5139796f4c
X-Patchwork-Hint: ignore
Message-Id: <20221023172606.9973786EC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irssi: bump to version 1.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=68e1b602dab1e08dc7c494cfdfeece5139796f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball link (from https://irssi.org/download)

https://irssi.org/2022/07/17/irssi-1.4.2-released/
https://irssi.org/2022/06/12/irssi-1.4.1-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 05555250a7..ecd339d83d 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f  irssi-1.2.3.tar.xz
+sha256  79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8  irssi-1.4.2.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index da71622a04..c2d02289ad 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.2.3
+IRSSI_VERSION = 1.4.2
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
-# Do not use the github helper here. The generated tarball is *NOT* the
-# same as the one uploaded by upstream for the release.
-IRSSI_SITE = https://github.com/irssi/irssi/releases/download/$(IRSSI_VERSION)
+IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_CPE_ID_VENDOR = irssi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
