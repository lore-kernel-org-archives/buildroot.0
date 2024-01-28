Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1807BC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 16:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6723F411C6;
	Sun, 28 Jan 2024 16:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6723F411C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtCcjIIcLq8H; Sun, 28 Jan 2024 16:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F282410E1;
	Sun, 28 Jan 2024 16:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F282410E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECAFC1BF2F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E7E3410E1
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E7E3410E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wGZZVMT7GXW for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 16:38:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E2E410DF
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 16:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E2E410DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFBCA86655; Sun, 28 Jan 2024 16:38:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 17:37:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46d4f5c7519f949751b80c3e73fa055c07796c4e
X-Git-Newrev: b80705800a5a4f5dfd1a1edccca001a3a0a4ef3a
X-Patchwork-Hint: ignore
Message-Id: <20240128163859.AFBCA86655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=b80705800a5a4f5dfd1a1edccca001a3a0a4ef3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:x.org:xorg-server is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/79A86C02-31A5-4F25-8CA6-7C4A8CD92B7B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4a05582583..1d0807ffec 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,6 +9,8 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
+XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
+XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
