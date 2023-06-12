Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C1C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 173EB80C06;
	Mon, 12 Jun 2023 15:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 173EB80C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UCxnY5__2DG; Mon, 12 Jun 2023 15:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275188446A;
	Mon, 12 Jun 2023 15:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275188446A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DEF71BF398
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8415A40257
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8415A40257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEmLaGInEST4 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:58:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829A740252
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 15:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829A740252
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F7CD82808; Mon, 12 Jun 2023 15:58:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 17:57:17 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2b8e7f2e40b7ea93964f4d6aa845925f0749d3d8
X-Git-Newrev: e505488a0e034c074bf5897b4788e45670e82f6c
X-Patchwork-Hint: ignore
Message-Id: <20230612155822.6F7CD82808@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python3: bump
 version to 3.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e505488a0e034c074bf5897b4788e45670e82f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Bugfix release, fixing a number of issues. For details, see the changelog:

https://docs.python.org/release/3.11.3/whatsnew/changelog.html#python-3-11-3

Notice: This also includes security fixes, but these are for Windows-only
issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ab6053fee559a1670b65f7319d32616d5a90bb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 2 +-
 package/python3/python3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f235347efb..b04ee7fa2c 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af  Python-3.11.2.tar.xz
+sha256  8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e  Python-3.11.3.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 56fe95cd07..ece5cad93e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
