Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC57C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E16FA408B4;
	Tue, 15 Mar 2022 20:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRK9D_oLqt_K; Tue, 15 Mar 2022 20:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1DAC4056D;
	Tue, 15 Mar 2022 20:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491191BF9B6
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349934026E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5zgo0o61mbc for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71242408B7
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A45883F83; Tue, 15 Mar 2022 20:10:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 20:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eceb90dc76f8e1a49e92076fd032dc98622a4535
X-Git-Newrev: 978b6be59f144bc5f7e2f0948cb357415238d56a
X-Patchwork-Hint: ignore
Message-Id: <20220315201012.9A45883F83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cukinia: bump to version 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=978b6be59f144bc5f7e2f0948cb357415238d56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/savoirfairelinux/cukinia/compare/v0.5.1...v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cukinia/cukinia.hash | 2 +-
 package/cukinia/cukinia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index e6ae602011..6e76a6ab88 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b867ec63e448e7fa0a9276f6844a8b3a8f92d99e63e8518fe24e9debd32679b5  cukinia-0.5.1.tar.gz
+sha256  79dc77c7b9f2784e7d22d961dd2c4ad9c78deebbc6e8f39df4fa214118682b40  cukinia-0.6.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index 84d4e60ea8..798c199b67 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.5.1
+CUKINIA_VERSION = 0.6.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
 CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
 CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
