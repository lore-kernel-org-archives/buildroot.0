Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C53C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A7D6114B;
	Tue, 21 Feb 2023 01:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A7D6114B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7kBuPgbeCr1; Tue, 21 Feb 2023 01:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFCE61143;
	Tue, 21 Feb 2023 01:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDFCE61143
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED011BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0CC941824
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0CC941824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUlAhz0jn2Rg for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15B884010E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15B884010E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1343A86495; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:52:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6085c00d0feece6f3ba635e7847ea653bc5fac3
X-Git-Newrev: be235c048f004617851d7ef752ee5f4dc2373e28
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.1343A86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: bump version
 to 3.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=be235c048f004617851d7ef752ee5f4dc2373e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://docs.python.org/release/3.11.2/whatsnew/changelog.html#python-3-11-2

Updated license hash due to copyright year bump:
https://github.com/python/cpython/commit/07d1f99e8faefcf24dab2113fb0df27202fa6f71

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7f079865d9..f235347efb 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f  Python-3.11.1.tar.xz
-sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
+sha256  29e4b8f5f1658542a8c13e2dd277358c9c48f2b2f7318652ef1675e402b9d2af  Python-3.11.2.tar.xz
+sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fb6dbf2e64..56fe95cd07 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
