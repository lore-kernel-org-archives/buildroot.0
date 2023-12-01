Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F882C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2868941A01;
	Fri,  1 Dec 2023 20:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2868941A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iDaQhwLY8XP; Fri,  1 Dec 2023 20:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 004AE43776;
	Fri,  1 Dec 2023 20:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 004AE43776
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6429A1BF995
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE3F437AA
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE3F437AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIRZQ9OsfPFs for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7DD43776
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B7DD43776
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A8B487747; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:05:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a914f7ff04847f8889eecb1d03fa4b409620f791
X-Git-Newrev: f8071bd7848976c80c27a516663171dc125a50f3
X-Patchwork-Hint: ignore
Message-Id: <20231201201359.4A8B487747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/imagemagick:
 security bump to version 7.1.1-21
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8071bd7848976c80c27a516663171dc125a50f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-1289, CVE-2023-2157, CVE-2023-34151, CVE-2023-34152,
CVE-2023-34153, CVE-2023-3428, CVE-2023-34474 and CVE-2023-34475

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 758d79faec0d95c57489296658517b1fd9fb5040)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 8988dad5da..fd80316ec5 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4333ef2fe63f2510988af82b726f5b1919ebd54037ea6674566c69fcceb67e11  imagemagick-7.1.0-51.tar.gz
+sha256  09402e5f17c6575ef9f010bb2e21ae1710f1f3426f115ad4317ee9129c32608e  imagemagick-7.1.1-21.tar.gz
 sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8a2ec460d5..57ea405e89 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-51
+IMAGEMAGICK_VERSION = 7.1.1-21
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
