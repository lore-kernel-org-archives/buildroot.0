Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B9C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 030174154D;
	Mon, 11 Sep 2023 19:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 030174154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlHQXIXWuhDf; Mon, 11 Sep 2023 19:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55EB54154C;
	Mon, 11 Sep 2023 19:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55EB54154C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21E231BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0738414E7
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0738414E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKrUzWVO7-RI for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D40DE414DB
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D40DE414DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3D4E86CAE; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:18:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b84c105d18d7bdc6d8079793faae686eea307da7
X-Git-Newrev: ecdfc9bb2faafb01e9c9c86bbf52ecfcad9dc5a6
X-Patchwork-Hint: ignore
Message-Id: <20230911190853.C3D4E86CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/bwm-ng: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecdfc9bb2faafb01e9c9c86bbf52ecfcad9dc5a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
