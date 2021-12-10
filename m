Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACDBC433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18032412D3;
	Fri, 10 Dec 2021 19:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GeXFYMxKecDe; Fri, 10 Dec 2021 19:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16218412D1;
	Fri, 10 Dec 2021 19:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 886E41BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE52412C5
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrcgV7E1M0GD for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF271412D1
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 38C9C8255D; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 19:33:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55a7666834e50cb756d7db2fb2ce7a535af61a77
X-Git-Newrev: 83bf1790c13a6a6ba4e4008f685d7b824ed15079
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.38C9C8255D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5quickcontrols2: fix project URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=83bf1790c13a6a6ba4e4008f685d7b824ed15079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://doc.qt.io/qt-5/qtquickcontrols2-index.html is re-directed to
https://doc.qt.io/qt-5/qtquickcontrols-index.html so use it directly

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
