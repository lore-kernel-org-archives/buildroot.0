Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B149AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:29:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094AF61205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 094AF61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC36C40510;
	Sun, 19 Sep 2021 11:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CS-aJkn_laEy; Sun, 19 Sep 2021 11:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFCA40507;
	Sun, 19 Sep 2021 11:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED4E1BF95D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E4474024B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1q_1-jQcj17q for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:29:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB974024A
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:29:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6BC198B783; Sun, 19 Sep 2021 11:27:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 13:25:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50fe5bbbfd0f1bbf9e72d9bfe940107ae792ecba
X-Git-Newrev: 390a00a871bb72a15e180bbede96bf4a1027ad05
X-Patchwork-Hint: ignore
Message-Id: <20210919112718.6BC198B783@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tclap: bump to version 1.2.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=390a00a871bb72a15e180bbede96bf4a1027ad05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://sourceforge.net/p/tclap/code/ci/v1.2.4/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tclap/tclap.hash | 4 ++--
 package/tclap/tclap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
index 2b2097be97..fdfd46a2e4 100644
--- a/package/tclap/tclap.hash
+++ b/package/tclap/tclap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	f5013be7fcaafc69ba0ce2d1710f693f61e9c336b6292ae4f57554f59fde5837  tclap-1.2.2.tar.gz
-sha256	cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
+sha256  634c5b59dbb1ccbc9d6a5f6de494a257e29a3f59dcb6fc30445ff39b45188574  tclap-1.2.4.tar.gz
+sha256  cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index e1856420f3..d7f96bd034 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCLAP_VERSION = 1.2.2
+TCLAP_VERSION = 1.2.4
 TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
