Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE36C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 381536121B;
	Mon, 30 May 2022 20:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0TrenTQ5nae; Mon, 30 May 2022 20:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AFF60E3F;
	Mon, 30 May 2022 20:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3021BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2800560E3F
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKjU6_e6M1ax for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7183460B4B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:26:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 924EF867B2; Mon, 30 May 2022 20:14:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c34434d803c533742e65e1a93669f11f28301384
X-Git-Newrev: 1d969398e4eda833734bab9744078cce434d8db2
X-Patchwork-Hint: ignore
Message-Id: <20220530201450.924EF867B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbv: renumber patches
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d969398e4eda833734bab9744078cce434d8db2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9863553fe8fa16a4d19f652b409a44bb58ef5567 forgot to renumber
patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbv/{0002-cross.patch => 0001-cross.patch}                        | 0
 ...ort-on-big-endian.patch => 0002-fix-24bpp-support-on-big-endian.patch} | 0
 package/fbv/{0004-fix-bgr555.patch => 0003-fix-bgr555.patch}              | 0
 package/fbv/{0005-giflib.patch => 0004-giflib.patch}                      | 0
 package/fbv/{0006-include.patch => 0005-include.patch}                    | 0
 package/fbv/{0007-libpng15.patch => 0006-libpng15.patch}                  | 0
 6 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/fbv/0002-cross.patch b/package/fbv/0001-cross.patch
similarity index 100%
rename from package/fbv/0002-cross.patch
rename to package/fbv/0001-cross.patch
diff --git a/package/fbv/0003-fix-24bpp-support-on-big-endian.patch b/package/fbv/0002-fix-24bpp-support-on-big-endian.patch
similarity index 100%
rename from package/fbv/0003-fix-24bpp-support-on-big-endian.patch
rename to package/fbv/0002-fix-24bpp-support-on-big-endian.patch
diff --git a/package/fbv/0004-fix-bgr555.patch b/package/fbv/0003-fix-bgr555.patch
similarity index 100%
rename from package/fbv/0004-fix-bgr555.patch
rename to package/fbv/0003-fix-bgr555.patch
diff --git a/package/fbv/0005-giflib.patch b/package/fbv/0004-giflib.patch
similarity index 100%
rename from package/fbv/0005-giflib.patch
rename to package/fbv/0004-giflib.patch
diff --git a/package/fbv/0006-include.patch b/package/fbv/0005-include.patch
similarity index 100%
rename from package/fbv/0006-include.patch
rename to package/fbv/0005-include.patch
diff --git a/package/fbv/0007-libpng15.patch b/package/fbv/0006-libpng15.patch
similarity index 100%
rename from package/fbv/0007-libpng15.patch
rename to package/fbv/0006-libpng15.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
