Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D511ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD446122C;
	Fri, 16 Sep 2022 11:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD446122C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2GMuWlLlW7S; Fri, 16 Sep 2022 11:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D15A6123D;
	Fri, 16 Sep 2022 11:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D15A6123D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8981BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA47419E3
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA47419E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jNVO7tIJZpH for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDAF341C8F
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDAF341C8F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B8C8883CC3; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:26:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3cbac6d4c2c7a5d46d65e1520513bbcda55202b0
X-Git-Newrev: 6f34a1734c9574ebc7802c60a12ab77b1fddb90e
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.B8C8883CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jquery-ui-themes:
 fix typo on BR2_PACKAGE_JQUERY_UI_THEMES_VADER
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f34a1734c9574ebc7802c60a12ab77b1fddb90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The typo was added in 2018 by commit
'94c146282f jquery-ui-themes: rename options to have proper prefix'

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f008c74061e604069d9716ac97d2a3f78c9f00b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery-ui-themes/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index 29359544ac..b372d40b60 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -112,6 +112,6 @@ config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
 	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
 	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
 	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
-	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_UI_VADER
+	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_VADER
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
