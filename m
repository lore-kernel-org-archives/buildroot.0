Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31717C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D976961039;
	Tue, 29 Mar 2022 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9zpKOc7EYGF; Tue, 29 Mar 2022 20:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF2F61137;
	Tue, 29 Mar 2022 20:29:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2D41BF9BA
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369AC40BCA
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KT-YeGqHdlZ8 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D1440165
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2764A85F63; Tue, 29 Mar 2022 20:20:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:57:32 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 658763f397e5e418c115e367aca20b18132764d9
X-Git-Newrev: 45fcdf9bf9a54401f77b8f268d5494151de93c90
X-Patchwork-Hint: ignore
Message-Id: <20220329202014.2764A85F63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-avro:
 renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=45fcdf9bf9a54401f77b8f268d5494151de93c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 77704462c9e2422b6f9a07d35d88918e790e6940 forgot to renumber
patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4a23f6b7b011fee47812bb70a11c21b9d68844b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ing.patch => 0001-drop-install-time-linting-and-imports-sorting.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch b/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
similarity index 100%
rename from package/python-avro/0002-drop-install-time-linting-and-imports-sorting.patch
rename to package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
