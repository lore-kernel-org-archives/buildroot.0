Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C39CC4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31D1340912;
	Sat,  3 Feb 2024 18:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D1340912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9anZj8iXl3M6; Sat,  3 Feb 2024 18:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FF16405E0;
	Sat,  3 Feb 2024 18:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF16405E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 739001BF29D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 554844027F
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxiae7kZwKjs for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB3F040522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3F040522
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3F040522
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2446C8680C; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:10:40 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 404e6cc2eb6442d75c4fba79212adf9465cbac37
X-Git-Newrev: 1c1d4ada3b65e0dd00e5d4bfe892e7eef8a91ea8
X-Patchwork-Hint: ignore
Message-Id: <20240203122852.2446C8680C@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/qt5/qt5base: add
 QT5BASE_CPE_ID_VENDOR and QT5BASE_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c1d4ada3b65e0dd00e5d4bfe892e7eef8a91ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:qt:qt:5.15.8:*:*:*:*:*:*:* is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/3A753A6D-0AFE-4E62-9C2F-58C8B630830C

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 107d39c1a7e77b3668f923f2f84f961acfaefa53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cc29f5523f..91891a2ec2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -7,6 +7,8 @@
 QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
+QT5BASE_CPE_ID_VENDOR = qt
+QT5BASE_CPE_ID_PRODUCT = qt
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
