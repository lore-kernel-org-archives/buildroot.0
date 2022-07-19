Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F69C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA43C82733;
	Tue, 19 Jul 2022 16:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA43C82733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPS4C--Vjw0g; Tue, 19 Jul 2022 16:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0344482702;
	Tue, 19 Jul 2022 16:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0344482702
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6128C1BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B54440C67
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B54440C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwIh18bvBbWs for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:26:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84098401A2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84098401A2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 74D2183DD8; Tue, 19 Jul 2022 16:12:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 18:22:27 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 690eaefb800f09bfb4fa4515289126b85ecf79d9
X-Git-Newrev: 7e0ee5c054231da22983d1a0668f32281e17ad0e
X-Patchwork-Hint: ignore
Message-Id: <20220719161254.74D2183DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sofia-sip: add
 SOFIA_SIP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e0ee5c054231da22983d1a0668f32281e17ad0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cpe:2.3:a:signalwire:sofia-sip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asignalwire%3Asofia-sip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b77ee6ce55455f5895502ada254909a00ff47944)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 2bac480542..c7698c9a11 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -10,6 +10,7 @@ SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
+SOFIA_SIP_CPE_ID_VENDOR = signalwire
 SOFIA_SIP_CONF_OPTS = --with-doxygen=no
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
