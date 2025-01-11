Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA13E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B7946078E;
	Sat, 11 Jan 2025 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qX9Iw425FTc; Sat, 11 Jan 2025 16:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFBD606CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFBD606CE;
	Sat, 11 Jan 2025 16:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48E6C953
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AD808111C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Trf5YuLU0yjd for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6215181133
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6215181133
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:43:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D43D84693; Sat, 11 Jan 2025 16:43:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:29:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bfc91ff4a0c32c150efea2f7c2d9d024e8699ff
X-Git-Newrev: 0cde293a4fe0f92f7f07b159ec6be61b5dc567ff
X-Patchwork-Hint: ignore
Message-Id: <20250111164329.4D43D84693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dunamai: bump to version
 1.23.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0cde293a4fe0f92f7f07b159ec6be61b5dc567ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dunamai/python-dunamai.hash | 4 ++--
 package/python-dunamai/python-dunamai.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
index a2a92b8699..9c0fcc1810 100644
--- a/package/python-dunamai/python-dunamai.hash
+++ b/package/python-dunamai/python-dunamai.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  1b3ca932416961ea6953dbbc21e6d42c  dunamai-1.22.0.tar.gz
-sha256  375a0b21309336f0d8b6bbaea3e038c36f462318c68795166e31f9873fdad676  dunamai-1.22.0.tar.gz
+md5  5aa5f8aa470a4e8f67430b1a8a6ff801  dunamai-1.23.0.tar.gz
+sha256  a163746de7ea5acb6dacdab3a6ad621ebc612ed1e528aaa8beedb8887fccd2c4  dunamai-1.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
index bd6c71fd6a..ba422f5b2f 100644
--- a/package/python-dunamai/python-dunamai.mk
+++ b/package/python-dunamai/python-dunamai.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DUNAMAI_VERSION = 1.22.0
+PYTHON_DUNAMAI_VERSION = 1.23.0
 PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/a0/fe/aee602f08765de4dd753d2e5d6cbd480857182e345f161f7a19ad1979e4d
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/06/4e/a5c8c337a1d9ac0384298ade02d322741fb5998041a5ea74d1cd2a4a1d47
 PYTHON_DUNAMAI_SETUP_TYPE = poetry
 PYTHON_DUNAMAI_LICENSE = MIT
 PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
