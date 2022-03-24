Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C75C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 398F6401E1;
	Thu, 24 Mar 2022 21:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDhKz-LvT5d7; Thu, 24 Mar 2022 21:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F331841085;
	Thu, 24 Mar 2022 21:15:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A43691BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 934B241738
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMLGDw1h7OtL for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD5A41708
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C51D985C5C; Thu, 24 Mar 2022 21:06:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:51:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94515b902c74d51aeb32654a4795ca92d6dd7279
X-Git-Newrev: 4a23f6b7b011fee47812bb70a11c21b9d68844b0
X-Patchwork-Hint: ignore
Message-Id: <20220324210619.C51D985C5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-avro: renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a23f6b7b011fee47812bb70a11c21b9d68844b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 77704462c9e2422b6f9a07d35d88918e790e6940 forgot to renumber
patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
