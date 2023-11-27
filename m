Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D94C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81BA4182B;
	Mon,  4 Dec 2023 20:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81BA4182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MC6etr6Hn2Uh; Mon,  4 Dec 2023 20:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2020141AFC;
	Mon,  4 Dec 2023 20:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2020141AFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 429BB1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001E841986
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 001E841986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jaa8LVl3cw0 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7FEF4175C
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FEF4175C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDF88879B8; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 19:10:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc363e9a93484e734313b17962b931b3df6eedaa
X-Git-Newrev: 0868e3430bd4f6f8b05087c45a29e0df2cb46969
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.CDF88879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: bump to version 1.7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0868e3430bd4f6f8b05087c45a29e0df2cb46969
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
- https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.4

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 665023d87b..fdb30de88d 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f059dbebf5156a9ab97cd3c1f41ad5df3436c7ab4dd6dbffa234fc4e93cfa2ce  makedumpfile-1.7.3.tar.gz
+sha256  0554f5de516c51f5756e437dbfc353722b16b20e875241275554b474e89298db  makedumpfile-1.7.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 6102c92bd8..410752682d 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.3
+MAKEDUMPFILE_VERSION = 1.7.4
 MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
