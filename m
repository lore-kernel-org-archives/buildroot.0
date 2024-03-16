Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB49C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D6D40600;
	Sat, 16 Mar 2024 22:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rd8eV9gFmE9Q; Sat, 16 Mar 2024 22:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A78040645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A78040645;
	Sat, 16 Mar 2024 22:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58C7F1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 440BF4098E
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDEPdBzNiJbZ for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 480CD40645
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 480CD40645
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33CA1822E2; Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:24:31 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 13ffa6537692737dd86256e96eca3a86a5dc8216
X-Git-Newrev: 30652bd1d587f260eabc19a01be631367f209a82
X-Patchwork-Hint: ignore
Message-Id: <20240316222506.33CA1822E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/c-ares: bump to
 version 1.26.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=30652bd1d587f260eabc19a01be631367f209a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Changelog: https://c-ares.org/changelog.html#1_26_0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 43ae599c9eeba74f4c9941435d9f8137723b86ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index c2897f6e44..ee097a53c9 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
+sha256  bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50  c-ares-1.26.0.tar.gz
 
 # Hash for license file
 sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 586fde9afb..29da6baa4b 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.20.1
+C_ARES_VERSION = 1.26.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
