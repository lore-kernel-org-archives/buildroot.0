Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63744C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48CB60F01;
	Sun, 17 Jul 2022 07:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48CB60F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbkagFulnEPQ; Sun, 17 Jul 2022 07:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C90D60C03;
	Sun, 17 Jul 2022 07:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C90D60C03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 351C61BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CDC360C03
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDC360C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imiD6ycDNez9 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:15:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A29C60BD6
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A29C60BD6
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9E7AD83901; Sun, 17 Jul 2022 07:01:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:14:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 107cff4616e31acc97890643df5fc689665649cb
X-Git-Newrev: 2025d665eca18a00da47b83bb333b6207281f5e3
X-Patchwork-Hint: ignore
Message-Id: <20220717070137.9E7AD83901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: renumber patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=2025d665eca18a00da47b83bb333b6207281f5e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix wrong patch number added by commit
2097e1ba3904be8f7cd388fe1d16a099da83ef99

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ments.patch => 0002-cmake-remove-duplicate-LwsCheckRequirements.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
similarity index 100%
rename from package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
rename to package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
