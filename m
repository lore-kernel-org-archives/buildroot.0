Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A682C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141C260ED8;
	Sun, 12 Dec 2021 22:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1HqsVednTDH; Sun, 12 Dec 2021 22:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73CE1607DD;
	Sun, 12 Dec 2021 22:31:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5351BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2571760673
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdX-MYki3r8x for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7731460791
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC1E98374D; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:21:53 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2bfa334e0e373f0ca95a7d45dd724d408f1c5595
X-Git-Newrev: 885057d920e496664dd140aa8214bfbe92fcaf00
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.DC1E98374D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/hiawatha: add
 HIAWATHA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=885057d920e496664dd140aa8214bfbe92fcaf00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:hiawatha-webserver:hiawatha is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahiawatha-webserver%3Ahiawatha

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f4a57a86e60cb5b705a9a8885da6edea874b8a24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/hiawatha.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 126cb71105..a917adc9a4 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -9,6 +9,7 @@ HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
+HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 
 HIAWATHA_CONF_OPTS = \
 	-DENABLE_TOOLKIT=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
