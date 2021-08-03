Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CCCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B170C61040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B170C61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78FBD40270;
	Tue,  3 Aug 2021 19:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkDjKQ1MyIXU; Tue,  3 Aug 2021 19:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87ACE401FA;
	Tue,  3 Aug 2021 19:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3017C1BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B354401FA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FwOTxRv6jHM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15953400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7549C8B354; Tue,  3 Aug 2021 19:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 21:39:35 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a75b0ffd89834906647d9d55a567c989310539bd
X-Git-Newrev: 525b98fd11976822fe15874a48ad272b9bc7dd3f
X-Patchwork-Hint: ignore
Message-Id: <20210803195719.7549C8B354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/trinity: add
 TRINITY_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=525b98fd11976822fe15874a48ad272b9bc7dd3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:trinity_project:trinity is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrinity_project%3Atrinity

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 60ef5ab91001dbcaa03ac78e64e96274fe0d0399)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trinity/trinity.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index adf7d1455c..befb8de826 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -9,6 +9,7 @@ TRINITY_SITE = http://codemonkey.org.uk/projects/trinity
 TRINITY_SOURCE = trinity-$(TRINITY_VERSION).tar.xz
 TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
+TRINITY_CPE_ID_VENDOR = trinity_project
 
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
