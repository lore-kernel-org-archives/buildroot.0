Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B827CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2543B6075A;
	Sun, 22 Sep 2024 16:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ5j9dcHeaI3; Sun, 22 Sep 2024 16:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8071860720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8071860720;
	Sun, 22 Sep 2024 16:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C87A91BF403
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4A6440124
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFA5D3TnP-Us for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B649D40018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B649D40018
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A20FB84295; Sun, 22 Sep 2024 16:23:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:04:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e3766f533aabd6a82f11093c31134b9553a023e
X-Git-Newrev: afe6c55f1931c4fcaf6d280a49019d0f7d184418
X-Patchwork-Hint: ignore
Message-Id: <20240922162313.A20FB84295@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=afe6c55f1931c4fcaf6d280a49019d0f7d184418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 4a194ad41e..5d722a1b95 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  b263ea268692cfe687d29d52daab4770  python-gnupg-0.5.2.tar.gz
-sha256  01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c  python-gnupg-0.5.2.tar.gz
+md5  48c77a551bed992d19f7a99e3c6fb9d6  python-gnupg-0.5.3.tar.gz
+sha256  290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47  python-gnupg-0.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index ddf2287f9b..00c1b9edde 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.2
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/5d/4425390ad81d22b330a1b0df204c4d39fb3cb7c39e081d51e9f7426ce716
+PYTHON_GNUPG_VERSION = 0.5.3
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/85/61/2df3cd6f49dbb2d4a6a567cac1d803e3a50d86207e196d0f9e67a48664f7
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
