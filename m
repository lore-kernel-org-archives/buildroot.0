Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF992C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 21:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C27F60E71;
	Fri,  4 Feb 2022 21:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfOAGVTlEPwC; Fri,  4 Feb 2022 21:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90F260E66;
	Fri,  4 Feb 2022 21:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0DB21BF59D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F7A340986
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkfmF8K8C_sr for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 21:55:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEEC4094D
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 21:55:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4294D82B2E; Fri,  4 Feb 2022 21:48:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Feb 2022 22:55:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 125ec43bf0ca74fbca5c96e6f436dabf945dd529
X-Git-Newrev: ed81b96cc549eeb0951e84303106699f728e089c
X-Patchwork-Hint: ignore
Message-Id: <20220204214813.4294D82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ddrescue: bump to version 1.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed81b96cc549eeb0951e84303106699f728e089c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00013.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ddrescue/ddrescue.hash | 4 ++--
 package/ddrescue/ddrescue.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 6877b7008d..f7c82b086b 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2020-03/msg00002.html
-sha256  ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063  ddrescue-1.25.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2022-01/msg00013.html
+sha256  e513cd3a90d9810dfdd91197d40aa40f6df01597bfb5ecfdfb205de1127c551f  ddrescue-1.26.tar.lz
 # Locally computed
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index f113681fa1..6d16d8701f 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.25
+DDRESCUE_VERSION = 1.26
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
 DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
