Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C13C19F2A
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A818F6111B;
	Sat, 30 Jul 2022 20:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A818F6111B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oBFa3CnUCwy; Sat, 30 Jul 2022 20:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10B461033;
	Sat, 30 Jul 2022 20:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B10B461033
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33F9A1BF290
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13F7741831
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F7741831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUj6873q8oRl for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 20:21:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D899C4182C
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 20:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D899C4182C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27C9086A2F; Sat, 30 Jul 2022 20:07:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 22:21:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2e399893b4f60f1e103228df6e4439d4e4ac3dd5
X-Git-Newrev: 9f4990579eb475b768496a5de584a298d9a58e62
X-Patchwork-Hint: ignore
Message-Id: <20220730200755.27C9086A2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/python3: bump
 version to 3.10.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f4990579eb475b768496a5de584a298d9a58e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Release notes:
https://docs.python.org/release/3.10.5/whatsnew/changelog.html#python-3-10-5-final

Drop md5 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e2b61502f0a736717fb0cb52316a3c6fc8eb59c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 4 +---
 package/python3/python3.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 5ae0add789..8052e3f6e0 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,3 @@
-# From https://www.python.org/downloads/release/python-3104/
-md5  21f2e113e087083a1e8cf10553d93599  Python-3.10.4.tar.xz
 # Locally computed
-sha256  80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19  Python-3.10.4.tar.xz
+sha256  8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486  Python-3.10.5.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6d03e2c6b1..40711dc99c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
