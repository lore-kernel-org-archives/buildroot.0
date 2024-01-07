Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C703FC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81EB760F10;
	Sun,  7 Jan 2024 22:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81EB760F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJXbEU7WKhdX; Sun,  7 Jan 2024 22:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C329660EF3;
	Sun,  7 Jan 2024 22:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C329660EF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 824E81BF869
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68FB881186
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68FB881186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUCx1sWhZfAM for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1C6881092
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C6881092
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81A6084A38; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 23:39:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0e44d4e383e0397bc91c2e697458923076e17536
X-Git-Newrev: 4aedd5f93b9bae6802c665593bb521633740b5f9
X-Patchwork-Hint: ignore
Message-Id: <20240107224412.81A6084A38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/putty: fix legal
 info
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aedd5f93b9bae6802c665593bb521633740b5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit bf284bcfbaa7f031713afcc4c4e33d54724b6f57 forgot to update hash of
license file (year updated)

Fixes:
 - http://autobuild.buildroot.org/results/900b3fe8d4bf029c6bca6ca63c6e093e42cc1072

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4038b6af4e7a6b47b01c4b71eacd999bf8300d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 05c1a9eea6..0ae2a86be8 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -4,4 +4,4 @@ sha256  428cc8666fbb938ebf4ac9276341980dcd70de395b33164496cf7995ef0ef0d8  putty-
 sha512  4f10f870b229c89e928921d3b350955ce1c1170a062e7943d9cc8dbd83389d82a9b844623541605f0db5a429d545c2d188bf8e384c6515466fae69b216120983  putty-0.79.tar.gz
 
 # Locally calculated
-sha256  7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8  LICENCE
+sha256  7ede37f344ee03436c155a375ecb6cdb42a77105baa6e7804bf43260dc4a0c54  LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
