Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4977AC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CD68500C;
	Sun,  4 Feb 2024 10:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CD68500C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4gzeamcqaay; Sun,  4 Feb 2024 10:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5470C84FD6;
	Sun,  4 Feb 2024 10:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5470C84FD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC9031BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1934192D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1934192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGryFMHA6IFT for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E28C341923
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28C341923
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D07F6868DB; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ae38ec621f4821dd3eaf7ad3b0174cad21116ff
X-Git-Newrev: 03a9171cced41f2ee94850d6237bcc54fdda0b1a
X-Patchwork-Hint: ignore
Message-Id: <20240204101728.D07F6868DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: update
 XLIB_LIBXPM_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=03a9171cced41f2ee94850d6237bcc54fdda0b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libxpm_project:libxpm has been deprecated in favor of
cpe:2.3:a:x.org:libxpm in October 2023:

  <cpe-item name="cpe:/a:libxpm_project:libxpm:3.5.15" deprecated="true" deprecation_date="2023-10-17T15:55:35.850Z">
    <title xml:lang="en-US">Libxpm Project Libxpm 3.5.15</title>
      <reference href="https://gitlab.freedesktop.org/xorg/lib/libxpm/-/tags">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libxpm_project:libxpm:3.5.15:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:x.org:libxpm:3.5.15:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 0bba3ea946..1239ba0d4d 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -9,7 +9,7 @@ XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
 XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
-XLIB_LIBXPM_CPE_ID_VENDOR = libxpm_project
+XLIB_LIBXPM_CPE_ID_VENDOR = x.org
 XLIB_LIBXPM_CPE_ID_PRODUCT = libxpm
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
