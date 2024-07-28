Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9819EC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62AB780E3A;
	Sun, 28 Jul 2024 20:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLjzREsd0v5X; Sun, 28 Jul 2024 20:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F12D80EA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F12D80EA7;
	Sun, 28 Jul 2024 20:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC1F1BF47D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA3054030C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCzQIPaVAEaU for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 20:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBC640305
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBBC640305
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 20:17:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42BC3828F8; Sun, 28 Jul 2024 20:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 22:09:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6eef18e6b06ab9daf79e09da5f12cd9070cabbc4
X-Git-Newrev: c99082a4b6d153f01decb06650c78e6ec808fee2
X-Patchwork-Hint: ignore
Message-Id: <20240728201713.42BC3828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.09
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c99082a4b6d153f01decb06650c78e6ec808fee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index f3fbba8673..78357d4f28 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cf8b151e4913b5b7f7a91dffd5c7306106a42477ec44e71d62c75f66ab61a57  ytree-2.05.tar.gz
+sha256  6927bf7475d777c40ecc1a8e5125316605683d91a5829a9251b44f12b09e435b  ytree-2.09.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 1bd2df46b6..ec59dd8dee 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.05
+YTREE_VERSION = 2.09
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
