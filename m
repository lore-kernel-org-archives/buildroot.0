Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3DDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAA140878;
	Sat, 15 Jan 2022 09:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_eBgItQj_WK; Sat, 15 Jan 2022 09:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7BB4087A;
	Sat, 15 Jan 2022 09:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DEFA1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA0060BFA
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldaezWG6tvMX for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:22:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4E7B60AA9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2E3E3817E6; Sat, 15 Jan 2022 09:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:22:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88606bd9eb4cc244388a3dec70a21d54ee3fe352
X-Git-Newrev: 67af1b5ba50f387f6fb6ec7cc67283e1c9813fc0
X-Patchwork-Hint: ignore
Message-Id: <20220115091609.2E3E3817E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/targetcli-fb: add
 TARGETCLI_FB_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=67af1b5ba50f387f6fb6ec7cc67283e1c9813fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:targetcli-fb_project:targetcli-fb is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atargetcli-fb_project%3Atargetcli-fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/targetcli-fb/targetcli-fb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 75643446d2..7425423b8f 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -10,6 +10,7 @@ TARGETCLI_FB_VERSION = 2.1.fb41
 TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
+TARGETCLI_FB_CPE_ID_VENDOR = targetcli-fb_project
 TARGETCLI_FB_SETUP_TYPE = setuptools
 TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
