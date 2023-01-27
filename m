Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BEFC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC916FAA8;
	Tue, 21 Feb 2023 01:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC916FAA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cbjwClLeVnD; Tue, 21 Feb 2023 01:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EDBA612D4;
	Tue, 21 Feb 2023 01:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EDBA612D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C65CE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A0A56FBC6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0A56FBC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGEq5T0UWCv3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9826E6FBB4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9826E6FBB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9521C828C8; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 11:46:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3fac163b9315a26f2ad041e0624fac283078d795
X-Git-Newrev: c373ca0572e2017e04bd48a9ce63151fb23e378a
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.9521C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Marcus
 Folkesson for libcamera/libcamera-apps
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

commit: https://git.buildroot.net/buildroot/commit/?id=c373ca0572e2017e04bd48a9ce63151fb23e378a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libcamera-apps is orphaned, so take care of it.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..b973c37b82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1890,6 +1890,8 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libcamera/
+F:	package/libcamera-apps/
 F:	package/libostree/
 F:	package/libselinux/
 F:	package/libsemanage/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
