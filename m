Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5DBC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA84040B23;
	Sun, 23 Apr 2023 10:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA84040B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZUI6uMcKtZT; Sun, 23 Apr 2023 10:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E37CB40BCB;
	Sun, 23 Apr 2023 10:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E37CB40BCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 404B91C2B8E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AAD860067
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAD860067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A26VH1COorKW for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AEFC605A4
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEFC605A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAE1B843AF; Sun, 23 Apr 2023 10:33:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:28:12 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7e86856d69666ae506bde293942ae335dd35fb4e
X-Git-Newrev: 5c7130f970a756df854373afce50b8a9b7aef1df
X-Patchwork-Hint: ignore
Message-Id: <20230423103321.EAE1B843AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] doc/manual: fix
 formatting slightly
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c7130f970a756df854373afce50b8a9b7aef1df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
[yann.morin.1998@free.fr: split off the previous patch by Thierry]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4468f828859de1f4be82655d63e96d59e760db7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index b3a8802452..ef6dbd3c2b 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -49,9 +49,10 @@ Buildroot configuration. Refer to xref:customize[] for more details.
 
 Before submitting patches for new boards it is recommended to test it by
 building it using latest gitlab-CI docker container. To do this use
-utils/docker-run script and inside it issue these commands:
++utils/docker-run+ script and inside it issue these commands:
+
 --------------------
- $ make +<boardname>_defconfig+
+ $ make <boardname>_defconfig
  $ make
 --------------------
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
