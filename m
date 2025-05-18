Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C406C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46A460665;
	Sun, 18 May 2025 14:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_oOEOJU2eYb; Sun, 18 May 2025 14:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1662760B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1662760B98;
	Sun, 18 May 2025 14:47:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 035B7DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F9660A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk6HwPu2Cmld for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95FD6064D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D95FD6064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D678587141; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:08:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0b166d8b5f4d3fd493aebed2a8b6bc433c024481
X-Git-Newrev: f520ab6aaace2901aaee6268aeba2f44206df18a
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.D678587141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libqrencode:
 update Config.in homepage url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f520ab6aaace2901aaee6268aeba2f44206df18a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The old home page url [1] redirects to https, and points to the
japanese version of the site.

The commit updates this url to the https english version of the
site [2].

[1] http://fukuchi.org/works/qrencode/index.html
[2] https://fukuchi.org/en/works/qrencode/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 564ae5e1ca0ca82d1cdddfb642695a4d4b9ef1b5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libqrencode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
index b86662621e..7c3d9e4df6 100644
--- a/package/libqrencode/Config.in
+++ b/package/libqrencode/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBQRENCODE
 	  QR Code is up to 7000 digits or 4000 characters, and is
 	  highly robust.
 
-	  http://fukuchi.org/works/qrencode/index.html
+	  https://fukuchi.org/en/works/qrencode/
 
 if BR2_PACKAGE_LIBQRENCODE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
