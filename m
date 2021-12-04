Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B31CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 23:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0CD982EB5;
	Sat,  4 Dec 2021 23:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNOVgKGF-Io0; Sat,  4 Dec 2021 23:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0B682977;
	Sat,  4 Dec 2021 22:59:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C826E1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C577482977
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWbginTxCtgr for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:59:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F18D81D7D
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:59:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C462A93629; Sat,  4 Dec 2021 22:55:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:59:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c4cd280eb720b095efdf1bb78a502d246a5601a
X-Git-Newrev: f4a57a86e60cb5b705a9a8885da6edea874b8a24
X-Patchwork-Hint: ignore
Message-Id: <20211204225503.C462A93629@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4a57a86e60cb5b705a9a8885da6edea874b8a24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:hiawatha-webserver:hiawatha is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahiawatha-webserver%3Ahiawatha

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
