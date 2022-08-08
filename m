Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61435C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F085882D0F;
	Mon,  8 Aug 2022 14:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F085882D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW37shyMyxeC; Mon,  8 Aug 2022 14:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B32382B34;
	Mon,  8 Aug 2022 14:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B32382B34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 772521BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E8960E67
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E8960E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uA4IDodgqoMj for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:37:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9734760E3A
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9734760E3A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E7E7E86FC5; Mon,  8 Aug 2022 14:22:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:35:57 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 94ea58679815319e7cef6c32d734585f137b0151
X-Git-Newrev: 943ec68988898352e5a66d52714f7596160332ae
X-Patchwork-Hint: ignore
Message-Id: <20220808142255.E7E7E86FC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libwebsockets:
 renumber patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=943ec68988898352e5a66d52714f7596160332ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix wrong patch number added by commit
2097e1ba3904be8f7cd388fe1d16a099da83ef99

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2025d665eca18a00da47b83bb333b6207281f5e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
