Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15166C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CCF605F6;
	Sun, 23 Oct 2022 18:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CCF605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8w0TgZEGiLN; Sun, 23 Oct 2022 18:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7668A60768;
	Sun, 23 Oct 2022 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7668A60768
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11A4C1BF308
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE9EA813D4
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9EA813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5ILQmUVfTZE for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 18:54:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F86813D1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 18:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F86813D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B344D86EF5; Sun, 23 Oct 2022 18:54:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 20:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae39821e26e28c2e24d54fcaf66824fc02f3f240
X-Git-Newrev: 88661b8aa11ac0a6770e809fbc87f2dfec506fcc
X-Patchwork-Hint: ignore
Message-Id: <20221023185437.B344D86EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyssh: bump to version 20220801
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

commit: https://git.buildroot.net/buildroot/commit/?id=88661b8aa11ac0a6770e809fbc87f2dfec506fcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/janmojzis/tinyssh/releases/tag/20220101
https://github.com/janmojzis/tinyssh/releases/tag/20220222
https://github.com/janmojzis/tinyssh/releases/tag/20220305
https://github.com/janmojzis/tinyssh/releases/tag/20220311
https://github.com/janmojzis/tinyssh/releases/tag/20220801

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyssh/tinyssh.hash | 2 +-
 package/tinyssh/tinyssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 30b5d13419..462ffb9002 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2a051437878998c7782d9d38ef13e5e7a76435ae6b9c3e9ec492c3a567bd6314  tinyssh-20210601.tar.gz
+sha256  234656fc8d369608eb5d0f3a26280e0e38e2e6b134cfc610b6e24bce176acd4f  tinyssh-20220801.tar.gz
 sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 05716bcfe1..1472f7ead1 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 20210601
+TINYSSH_VERSION = 20220801
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
 TINYSSH_LICENSE = Public Domain, CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
