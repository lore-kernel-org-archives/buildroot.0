Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC82AC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E70B405DE;
	Sat,  3 Feb 2024 18:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E70B405DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VS87k0Y5gf-z; Sat,  3 Feb 2024 18:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D35840637;
	Sat,  3 Feb 2024 18:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D35840637
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A65A1BF29D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECF8060AA5
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XA4ZdKz0NoGQ for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD0C960A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0C960A97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0C960A97
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E66F8680D; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:11:10 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1c1d4ada3b65e0dd00e5d4bfe892e7eef8a91ea8
X-Git-Newrev: 2071d9fe3f9feb39a0b8118a2243221626410e15
X-Patchwork-Hint: ignore
Message-Id: <20240203122852.2E66F8680D@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/qt6/qt6base: add
 QT6BASE_CPE_ID_VENDOR and QT6BASE_CPE_ID_PRODUCT
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

commit: https://git.buildroot.net/buildroot/commit/?id=2071d9fe3f9feb39a0b8118a2243221626410e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:qt:qt:6.4.3:*:*:*:*:*:*:* is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/8397D12E-2D77-458E-B9C3-DC7B4775B1A7

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1bac67ba7442b3836621cc96943dffa45ddd880)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6base/qt6base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c32089f551..ba9a10ae06 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_CPE_ID_VENDOR = qt
+QT6BASE_CPE_ID_PRODUCT = qt
 
 QT6BASE_CMAKE_BACKEND = ninja
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
