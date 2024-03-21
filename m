Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF58C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29FB82C98;
	Thu, 21 Mar 2024 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6V_CkcLeKfg; Thu, 21 Mar 2024 21:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1099982CC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1099982CC7;
	Thu, 21 Mar 2024 21:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 241B31BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC21E608DA
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ayTaDmGksL5 for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C825C608BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C825C608BC
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5143837AB; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:58:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 11f142563e55e576604267da842d9536a7f23fac
X-Git-Newrev: a20c9280ae456b3895f9dc22fbdb85b04f80e8a8
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.C5143837AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/targetcli-fb:
 bump version to 2.1.58
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

commit: https://git.buildroot.net/buildroot/commit/?id=a20c9280ae456b3895f9dc22fbdb85b04f80e8a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

bump to latest version because previous version did not work with python 3.11
corrected version mismatch with my first submission

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 242781bb61bdad2690b089cc5eaf7705d2632e5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/targetcli-fb/targetcli-fb.hash | 2 +-
 package/targetcli-fb/targetcli-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 64f68a6675..1732fa99e5 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
+sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 444e54f8c7..e3f384810b 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.54
+TARGETCLI_FB_VERSION = 2.1.58
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
