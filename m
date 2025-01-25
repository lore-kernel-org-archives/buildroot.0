Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89F5C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A982380D46;
	Fri, 28 Feb 2025 17:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGxVNb2iCzW3; Fri, 28 Feb 2025 17:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BA080C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BA080C9A;
	Fri, 28 Feb 2025 17:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ADF61DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5889A42E90
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYAmtlXXrpRA for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5C842EA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C5C842EA4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 161B287A09; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 16:17:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c75ee1a6287e5402728efd5a4321634f345fd7d
X-Git-Newrev: eccc30ecd47da9ee5e50cc9009952d30dd22e3b4
X-Patchwork-Hint: ignore
Message-Id: <20250228163020.161B287A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tomli-w: bump
 to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eccc30ecd47da9ee5e50cc9009952d30dd22e3b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tomli-w/python-tomli-w.hash | 4 ++--
 package/python-tomli-w/python-tomli-w.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
index 1d0bbf881e..61b5baf9a8 100644
--- a/package/python-tomli-w/python-tomli-w.hash
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli-w/json
-md5  8a074845fdcbb1fb6855bec753f0f94e  tomli_w-1.1.0.tar.gz
-sha256  49e847a3a304d516a169a601184932ef0f6b61623fe680f836a2aa7128ed0d33  tomli_w-1.1.0.tar.gz
+md5  bfc49ccce117afc20bcaf50e80fcecfe  tomli_w-1.2.0.tar.gz
+sha256  2dd14fac5a47c27be9cd4c976af5a12d87fb1f0b4512f81d69cce3b35ae25021  tomli_w-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
index a6ca0cfbbc..b8881eb15b 100644
--- a/package/python-tomli-w/python-tomli-w.mk
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_W_VERSION = 1.1.0
+PYTHON_TOMLI_W_VERSION = 1.2.0
 PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
-PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/d4/19/b65f1a088ee23e37cdea415b357843eca8b1422a7b11a9eee6e35d4ec273
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/19/75/241269d1da26b624c0d5e110e8149093c759b7a286138f4efd61a60e75fe
 PYTHON_TOMLI_W_SETUP_TYPE = flit
 PYTHON_TOMLI_W_LICENSE = MIT
 PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
