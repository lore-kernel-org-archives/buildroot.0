Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E9BC636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4444189A;
	Thu,  9 Feb 2023 20:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4444189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B__fexdxYUmx; Thu,  9 Feb 2023 20:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1010A415F5;
	Thu,  9 Feb 2023 20:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1010A415F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 099571BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D76AB60E4E
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76AB60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehGNca0z2rQr for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297D760C1C
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 297D760C1C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 155B884924; Thu,  9 Feb 2023 20:47:41 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Feb 2023 21:44:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1bceb4b51581e0c7b3953181ee3a2c31f0094f6
X-Git-Newrev: 4856c75b2fe0cbab36fcae7f5f223026b24e884f
X-Patchwork-Hint: ignore
Message-Id: <20230209204741.155B884924@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-iscsi: add
 OPEN_ISCSI_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=4856c75b2fe0cbab36fcae7f5f223026b24e884f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:open-iscsi_project:open-iscsi is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen-iscsi_project%3Aopen-iscsi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/open-iscsi/open-iscsi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index 249253c64f..e5b965b80d 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -10,6 +10,7 @@ OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
 # well. See https://github.com/open-iscsi/open-iscsi/issues/379
 OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
 OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
 OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
 
 OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
