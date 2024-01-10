Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26025C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C78B143715;
	Wed, 10 Jan 2024 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78B143715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlcp67B9Zm_Z; Wed, 10 Jan 2024 22:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982A543760;
	Wed, 10 Jan 2024 22:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982A543760
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2DD71BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF374190F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF374190F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDZHkRic4jfb for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1AC741908
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1AC741908
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF72585E2F; Wed, 10 Jan 2024 22:04:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:04:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ca23b84e51cd9db7c45451a952135f2f79c5bcb
X-Git-Newrev: 9a8371e37db63e7dd14ba6ba524df39ce2d58a2e
X-Patchwork-Hint: ignore
Message-Id: <20240110220451.DF72585E2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trace-cmd: bump to version 3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a8371e37db63e7dd14ba6ba524df39ce2d58a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 6edcaf0e1c..30b0c48de6 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
+sha256  62af2c6062eeb434925921bb5936774b0a0e17a5f86671fa2ea2f40704a080cd  trace-cmd-v3.2.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ab8e9149f7..e02eb79530 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.1.7
+TRACE_CMD_VERSION = 3.2
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
