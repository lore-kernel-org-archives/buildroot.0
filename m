Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CA8E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F2A1608B4;
	Sun, 12 Jan 2025 11:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynHmu-7WP44l; Sun, 12 Jan 2025 11:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BC460A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BC460A51;
	Sun, 12 Jan 2025 11:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1996768
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1471440259
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj8uwrTU66Qo for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF51840287
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF51840287
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:33:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAE05852D2; Sun, 12 Jan 2025 11:33:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9d3ea40ea9f1784799caaa6b24b169cc9ba365c
X-Git-Newrev: a582313cf982bf6e85d0f0752d26ef5163fbf846
X-Patchwork-Hint: ignore
Message-Id: <20250112113340.DAE05852D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uswid: bump to version 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a582313cf982bf6e85d0f0752d26ef5163fbf846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uswid/python-uswid.hash | 4 ++--
 package/python-uswid/python-uswid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
index b6bf09c713..eb9011bad6 100644
--- a/package/python-uswid/python-uswid.hash
+++ b/package/python-uswid/python-uswid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uswid/json
-md5  e43ff6d49ddcda0c95338d3271694b91  uswid-0.5.0.tar.gz
-sha256  bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d  uswid-0.5.0.tar.gz
+md5  dc9a4aa4f9293b9e24c35c14dad6f296  uswid-0.5.1.tar.gz
+sha256  92b48a8f6601687c1cc556878571abf9ddb0bdbaf244713b7ff838c48fcb68b3  uswid-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index 2092a06f52..e6ca702742 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_USWID_VERSION = 0.5.0
+PYTHON_USWID_VERSION = 0.5.1
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/dc/bf/05291df12037befeacda2083c798e98691043978e07ca4a00b4eb94aeb61
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5c/67/9244d29d6391d49f30128da6c73a61c7a6c1f8bfcf0181f83298aa050832
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
