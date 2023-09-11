Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88272EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40117414D8;
	Mon, 11 Sep 2023 19:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40117414D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_QHBF2o-CdI; Mon, 11 Sep 2023 19:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79011414F8;
	Mon, 11 Sep 2023 19:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79011414F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1B5E1BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89B8C81EC3
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B8C81EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhQ9_-GFiIJ9 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB8C981EB9
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8C981EB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8CEF86C8F; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:18:46 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 562327441bd9677c9957ba815e9ab13566065a80
X-Git-Newrev: 67a31a5575c2c0f8aa2c9bae45b429b00338bad7
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.A8CEF86C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/bwm-ng: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=67a31a5575c2c0f8aa2c9bae45b429b00338bad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

bwm-ng_project:bwm-ng is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/DBF33404-2CC8-41FD-B0FF-039B27A19871?namingFormat=2.3&orderBy=CPEURI&keyword=bwm-ng&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d74515a3e83b6139aed764a5ef0f40115dc92e22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bwm-ng/bwm-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index de09eafae5..bf3ed74afc 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -9,6 +9,7 @@ BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
+BWM_NG_CPE_ID_VENDOR = bwm-ng_project
 BWM_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
