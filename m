Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E2C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04F104061F;
	Sat, 15 Oct 2022 15:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04F104061F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-P2mdJXq01b; Sat, 15 Oct 2022 15:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B80740639;
	Sat, 15 Oct 2022 15:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B80740639
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 799ED1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 622C381ADE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622C381ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbqODA5HSGE4 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A59781ABB
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A59781ABB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89FD786D90; Sat, 15 Oct 2022 15:27:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:23:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 403b05553911374f537781adb0c977c93bc6f61e
X-Git-Newrev: 3c6d0889d18cad3db1bf39d41a18d9c2b76d1da4
X-Patchwork-Hint: ignore
Message-Id: <20221015152740.89FD786D90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qdecoder: add
 QDECODER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c6d0889d18cad3db1bf39d41a18d9c2b76d1da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:qdecoder_project:qdecoder is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aqdecoder_project%3Aqdecoder

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d95faeea442796d0f79cae2bc666824955a668fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 05ee657131..c465617e26 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -8,6 +8,7 @@ QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
+QDECODER_CPE_ID_VENDOR = qdecoder_project
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
