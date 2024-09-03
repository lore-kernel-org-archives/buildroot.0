Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86870CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1FB784C2A;
	Fri,  6 Sep 2024 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xn1g24ztOYq; Fri,  6 Sep 2024 20:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC86584C2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC86584C2E;
	Fri,  6 Sep 2024 20:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38A191BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 743756078B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5Ex3ND2VR4m for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A91760E11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A91760E11
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17DDB86C5A; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:28:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1e95a78ae171c15ebaf76056cc8ce3708c610e8
X-Git-Newrev: ef28b4b039da7305ee269efe7625b7ea1031355a
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.17DDB86C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-xmpp: bump version to 1.8.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef28b4b039da7305ee269efe7625b7ea1031355a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-xmpp/erlang-xmpp.hash | 2 +-
 package/erlang-xmpp/erlang-xmpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-xmpp/erlang-xmpp.hash b/package/erlang-xmpp/erlang-xmpp.hash
index 703b610800..df509886f8 100644
--- a/package/erlang-xmpp/erlang-xmpp.hash
+++ b/package/erlang-xmpp/erlang-xmpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c227e3a32af4973308120aa726b945c2d3ab7187d47343fe65eb30e95bade0b0  erlang-xmpp-1.6.2.tar.gz
+sha256  2a099bdfb129c416fae6f7e713d94ad39153cf2e7bf6b277a970136190a28ff2  erlang-xmpp-1.8.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-xmpp/erlang-xmpp.mk b/package/erlang-xmpp/erlang-xmpp.mk
index 76f3d31b64..66d7223346 100644
--- a/package/erlang-xmpp/erlang-xmpp.mk
+++ b/package/erlang-xmpp/erlang-xmpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_XMPP_VERSION = 1.6.2
+ERLANG_XMPP_VERSION = 1.8.3
 ERLANG_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_XMPP_VERSION))
 ERLANG_XMPP_LICENSE = Apache-2.0
 ERLANG_XMPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
