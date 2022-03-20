Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E2EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41C1340574;
	Sun, 20 Mar 2022 21:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZ2CAVaonFHy; Sun, 20 Mar 2022 21:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F39EF404E9;
	Sun, 20 Mar 2022 21:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1E7B1BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D52C4031F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8JMlPx3MXT6 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D514022C
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95DD484639; Sun, 20 Mar 2022 21:17:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:24:19 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 80ca8b0a4bcc0373ffdf8c0fd4633e5c8aeaa27c
X-Git-Newrev: 7b2625c038650ca986aba5b5979d5212552b92e4
X-Patchwork-Hint: ignore
Message-Id: <20220320211733.95DD484639@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/usbguard: add
 USBGUARD_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b2625c038650ca986aba5b5979d5212552b92e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:usbguard_project:usbguard is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ausbguard_project%3Ausbguard

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c6a8192081a65fee20b7757ece8880c25c32ee6a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index c16a7529a9..d2b03eeb2a 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,6 +8,7 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
+USBGUARD_CPE_ID_VENDOR = usbguard_project
 USBGUARD_SELINUX_MODULES = usbguard
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
