Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFDEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD8682304;
	Mon, 20 Feb 2023 22:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD8682304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAZ6wvll1FIv; Mon, 20 Feb 2023 22:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D059F8234B;
	Mon, 20 Feb 2023 22:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D059F8234B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB78E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6139612AB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6139612AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwrk4jzbFoZs for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1103C611DC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1103C611DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B382828C8; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:16:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: acf4a7d1c72c468e269058ba52df40c9734c8801
X-Git-Newrev: 32c0225b7240c24002038779ad2035a5c16c6299
X-Patchwork-Hint: ignore
Message-Id: <20230220205210.0B382828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxkbcommon: add
 LIBXKBCOMMON_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=32c0225b7240c24002038779ad2035a5c16c6299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:xkbcommon:libxkbcommon is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axkbcommon%3Alibxkbcommon

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxkbcommon/libxkbcommon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index f2c49cc700..236bf4c5d9 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -9,6 +9,7 @@ LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
+LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
