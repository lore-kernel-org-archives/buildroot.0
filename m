Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506B1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E46409EF;
	Sun, 12 Dec 2021 17:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSV9xix-LYRU; Sun, 12 Dec 2021 17:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206B2409E8;
	Sun, 12 Dec 2021 17:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015571BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2AB740633
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nE4eS9T7BAIj for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1CF140194
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 879DD835C1; Sun, 12 Dec 2021 17:16:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:17:33 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7bc5438ff356a8ec0fc271eee8cb1c6bfa8b0848
X-Git-Newrev: 8466fdb4e4eb110f25ffe68ef83238d8ee6a4c69
X-Patchwork-Hint: ignore
Message-Id: <20211212171608.879DD835C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/icu: bump version
 to 69-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8466fdb4e4eb110f25ffe68ef83238d8ee6a4c69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes: http://site.icu-project.org/download/69

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6fefd4f21b0d000caf3221846907ea2754bf3b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 80cdd7df0c..5ed7cc4217 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
+sha256  4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745  icu4c-69_1-src.tgz
 sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4d67831c76..0a17c61462 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 68-1
+ICU_VERSION = 69-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
