Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF58C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 16:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115DD84C19;
	Fri, 28 Jan 2022 16:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwJSuA8tRqnV; Fri, 28 Jan 2022 16:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B9983F02;
	Fri, 28 Jan 2022 16:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4A21BF276
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD236110C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wh5qxP7euWkK for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 16:54:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BE660C0B
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 16:54:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0329C82AFB; Fri, 28 Jan 2022 16:47:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 17:53:14 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e2c278e83fd7774b5fcd52c1e82a4546639da03e
X-Git-Newrev: 6cdc0f655e9fad98d7c0239b9d8b6161b4c8f40d
X-Patchwork-Hint: ignore
Message-Id: <20220128164712.0329C82AFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/targetcli-fb: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cdc0f655e9fad98d7c0239b9d8b6161b4c8f40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

cpe:2.3:a:targetcli-fb_project:targetcli-fb is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atargetcli-fb_project%3Atargetcli-fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 67af1b5ba50f387f6fb6ec7cc67283e1c9813fc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
