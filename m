Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC747C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD1284B89;
	Fri, 14 Jan 2022 16:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPk0SP9hZPKC; Fri, 14 Jan 2022 16:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD9984B7F;
	Fri, 14 Jan 2022 16:20:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB811BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5742F84B7F
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8BrQKHROLdk for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:18:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 521A5831D6
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E283835B1; Fri, 14 Jan 2022 16:11:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:57:47 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 4790030db42a013e44ccd31d9df7ba21756d6db8
X-Git-Newrev: 9c11f5d893ebdf10acb4e218856d5f6827e720bd
X-Patchwork-Hint: ignore
Message-Id: <20220114161151.2E283835B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 package/qt5quickcontrols2: fix project URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c11f5d893ebdf10acb4e218856d5f6827e720bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

https://doc.qt.io/qt-5/qtquickcontrols2-index.html is re-directed to
https://doc.qt.io/qt-5/qtquickcontrols-index.html so use it directly

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 83bf1790c13a6a6ba4e4008f685d7b824ed15079)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quickcontrols2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index 3f81e20d52..02e36257cc 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 	  This module was in tech preview in Qt 5.6, and promoted
 	  to a core module in Qt 5.7.0.
 
-	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
+	  https://doc.qt.io/qt-5/qtquickcontrols-index.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
