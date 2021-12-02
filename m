Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736DAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CF56F4B9;
	Thu,  2 Dec 2021 17:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BImDDzqpIZf7; Thu,  2 Dec 2021 17:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E646F4C4;
	Thu,  2 Dec 2021 17:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4140A1BF9D1
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B05B400D7
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M7dr6Z17ItCX for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7364340107
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5201192281; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:12:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0f6dfc4c5b91f39228e780c29ca02731c3c9370
X-Git-Newrev: 43e36f3acd720a1cfc4250909ff966d5dd647cd3
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.5201192281@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ktap: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=43e36f3acd720a1cfc4250909ff966d5dd647cd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
3e1e7db3cc677e9d68a7f0ec74406ab986dcc512

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ktap/ktap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 09daba5c53..eec8b75b7f 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -20,7 +20,7 @@ define KTAP_BUILD_CMDS
 endef
 
 define KTAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
+	$(INSTALL) -D -m755 $(@D)/ktap $(TARGET_DIR)/usr/bin/ktap
 endef
 
 KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
