Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C62C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 14:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8325040934;
	Sun, 18 Dec 2022 14:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8325040934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JlFh4IyRQFu3; Sun, 18 Dec 2022 14:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D934092B;
	Sun, 18 Dec 2022 14:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D934092B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5462C1BF3DC
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8FB60615
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8FB60615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6asFXppj-iD0 for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 672E060648
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672E060648
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5595C86902; Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:35:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aceee9b1dc2c1c3e7f22ff2892aa580378d741b
X-Git-Newrev: f51e1f9522393864ea1543e581e485f2e7c1e683
X-Patchwork-Hint: ignore
Message-Id: <20221218143632.5595C86902@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supertuxkart: bump version to 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f51e1f9522393864ea1543e581e485f2e7c1e683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/supertuxkart/stk-code/blob/1.4/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertuxkart/supertuxkart.hash | 2 +-
 package/supertuxkart/supertuxkart.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 6ae3fae82b..446a9de8ec 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eeabeb0d9801688a218f6f0a76ea3546a46a322ccaca9a258148ecacfe083ffd  SuperTuxKart-1.3-src.tar.xz
+sha256  9890392419baf4715313f14d5ad60746f276eed36eb580636caf44e2532c0f03  SuperTuxKart-1.4-src.tar.xz
 sha256  d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 8ec366f792..1f9ad4102b 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.3
+SUPERTUXKART_VERSION = 1.4
 SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
