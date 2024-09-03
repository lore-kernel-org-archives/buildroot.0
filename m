Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1CBCD37B1
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1656981127;
	Tue,  3 Sep 2024 22:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1soI6kuKhIe; Tue,  3 Sep 2024 22:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC792810AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC792810AF;
	Tue,  3 Sep 2024 22:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6CC61BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9652E40A64
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO5O4OUlZzGZ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17D040A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D17D040A75
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE9C88669F; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:29:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 065104d640b7727ed010eb57d1cf3b330b370bb3
X-Git-Newrev: 1d4d210801d629763ae9ea4c2e1f05ca86393210
X-Patchwork-Hint: ignore
Message-Id: <20240903224341.CE9C88669F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-sip: bump
 version to 1.0.54
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d4d210801d629763ae9ea4c2e1f05ca86393210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 87c0742bfc..d2e40e8fdc 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  895a143fc90f0222649d103dd524def7fed6665c52600c2bba61e9f69d132372  erlang-p1-sip-1.0.49.tar.gz
+sha256  9336f02ea99cfad359c78c50fdd9c3061aac7b31966abdc3223f56b3ed7cc377  erlang-p1-sip-1.0.54.tar.gz
 sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 45c70e8899..36758b8681 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.49
+ERLANG_P1_SIP_VERSION = 1.0.54
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
