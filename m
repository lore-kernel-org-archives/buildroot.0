Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6939CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B14C38119E;
	Tue,  3 Sep 2024 22:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EIxrN3NXzSZ; Tue,  3 Sep 2024 22:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229F081188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229F081188;
	Tue,  3 Sep 2024 22:45:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD21D1BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C7AF40A6C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmlluhyi0AJT for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DF840A6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5DF840A6D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C261086D80; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:29:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3547546fe15857cd52fff893d835f0fe1dcb6e85
X-Git-Newrev: 065104d640b7727ed010eb57d1cf3b330b370bb3
X-Patchwork-Hint: ignore
Message-Id: <20240903224341.C261086D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-acme: bump
 version to 1.0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=065104d640b7727ed010eb57d1cf3b330b370bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-p1-acme/erlang-p1-acme.hash | 2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index e417d4b181..0894176fbd 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a445b66e76acdf1342eda166344004473bf4f45ad7e7f5ae38fb0333d896eb2d  erlang-p1-acme-1.0.22.tar.gz
+sha256  59a0113022c87afe25a8664fba76739b0ad481e25081599e0b69a098f6d628ed  erlang-p1-acme-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index cb8c7a8a19..5c7c5cc9e9 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.22
+ERLANG_P1_ACME_VERSION = 1.0.23
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
