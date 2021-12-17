Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC90840C0C;
	Fri, 17 Dec 2021 17:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pILAjzLYTRG; Fri, 17 Dec 2021 17:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 171D240633;
	Fri, 17 Dec 2021 17:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27F691C1162
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2520D84BCF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZwtiUMi6Uy2 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3752684CA4
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8C3CB82226; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:42:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feeed6f38eb592c8f72e4232c7c4f11e713e1d4b
X-Git-Newrev: 1b44913df9b09e4abff3f0419f2b8cd4234dfa1f
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.8C3CB82226@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: switch _SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b44913df9b09e4abff3f0419f2b8cd4234dfa1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pugixml/pugixml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index ddda5a3ccc..bc018180ef 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PUGIXML_VERSION = 1.11.4
-PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
+PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
 PUGIXML_CPE_ID_VENDOR = pugixml_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
