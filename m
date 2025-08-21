Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30347CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 17:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E18EF8448E;
	Thu, 21 Aug 2025 17:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJd3vTF77NTE; Thu, 21 Aug 2025 17:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32078445C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32078445C;
	Thu, 21 Aug 2025 17:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B33D8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ACBA4098E
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOm3K3ArVOMx for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 17:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC4D40058
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEC4D40058
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 17:00:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB3D58773F; Thu, 21 Aug 2025 17:00:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 18:38:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dda699f3f1477ec91fd132f41d2f6f3ee09a4554
X-Git-Newrev: 68f4c4624c0a737ff750ec8958cf44ab11a45b5e
X-Patchwork-Hint: ignore
Message-Id: <20250821170045.DB3D58773F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-can: bump to
 version 4.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68f4c4624c0a737ff750ec8958cf44ab11a45b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/hardbyte/python-can/blob/v4.6.1/CHANGELOG.md#version-v461---2025-08-12

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien:
 - update changelog link to use tag
 - fix hash file to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index d343a4a6b9..d3c86c4eae 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  e22638e3e5d102e428614715dd04910f  python_can-4.5.0.tar.gz
-sha256  d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7  python_can-4.5.0.tar.gz
+md5  98a1f02a9983f7c117a23bfc444ae524  python_can-4.6.1.tar.gz
+sha256  290fea135d04b8504ebff33889cc6d301e2181a54099116609f940825ffe5005  python_can-4.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 1517777753..c1f27d6709 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.5.0
+PYTHON_CAN_VERSION = 4.6.1
 PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/6a/4b/b6fd103c3f2eb0ae942e0704642d396ebbaf87f4d82d0102560cc738fdf1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/74/f9/a9d99d36dd33be5badb747801c9255c3c526171a5542092eaacc73350fb8
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
