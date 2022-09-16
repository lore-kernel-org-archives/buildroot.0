Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32D9C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E0B18427D;
	Fri, 16 Sep 2022 11:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E0B18427D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6j36CrBPQQzj; Fri, 16 Sep 2022 11:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C469283F96;
	Fri, 16 Sep 2022 11:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C469283F96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACC641BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FF21842C3
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF21842C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZX1kgWNEva6 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7337C842C4
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7337C842C4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70F8583CBA; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:24:14 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bcbfc840f782c8cbc31826bb40bef6da433aae53
X-Git-Newrev: 381a6662c1173a9e528373a39a35b4f47887b600
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.70F8583CBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/kodi: fix typo on
 BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
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

commit: https://git.buildroot.net/buildroot/commit/?id=381a6662c1173a9e528373a39a35b4f47887b600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Typo was added in 2021 by commit
148e695e37 package/kodi: bump version to 19.0-Matrix

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9c26ee1e58e17f6d64c2f150d7ba5b070a376ec8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4c6e01745c..90710683db 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -250,7 +250,7 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
 		BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_LIBVDPAU
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
