Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D342D24455
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F8C2413C4;
	Thu, 10 Oct 2024 21:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShAtOs6pFyrl; Thu, 10 Oct 2024 21:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA84F41324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA84F41324;
	Thu, 10 Oct 2024 21:32:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E16E11BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E2D81771
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO4Mmau21Z4n for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E6081F78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E6081F78
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F14885C8A; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3064d3d007cbd20a823733cfa1426e3795a95229
X-Git-Newrev: 908ebf2f68e4c3bfc0590c627cd0c11d472d005c
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.5F14885C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli-w: bump to version
 1.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=908ebf2f68e4c3bfc0590c627cd0c11d472d005c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tomli-w/python-tomli-w.hash | 4 ++--
 package/python-tomli-w/python-tomli-w.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
index 778c22583a..1d0bbf881e 100644
--- a/package/python-tomli-w/python-tomli-w.hash
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli-w/json
-md5  2c050134d4842b449ec4129c97d51e62  tomli_w-1.0.0.tar.gz
-sha256  f463434305e0336248cac9c2dc8076b707d8a12d019dd349f5c1e382dd1ae1b9  tomli_w-1.0.0.tar.gz
+md5  8a074845fdcbb1fb6855bec753f0f94e  tomli_w-1.1.0.tar.gz
+sha256  49e847a3a304d516a169a601184932ef0f6b61623fe680f836a2aa7128ed0d33  tomli_w-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
index d5d7ab9f2c..a6ca0cfbbc 100644
--- a/package/python-tomli-w/python-tomli-w.mk
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_W_VERSION = 1.0.0
+PYTHON_TOMLI_W_VERSION = 1.1.0
 PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
-PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/49/05/6bf21838623186b91aedbda06248ad18f03487dc56fbc20e4db384abde6c
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/d4/19/b65f1a088ee23e37cdea415b357843eca8b1422a7b11a9eee6e35d4ec273
 PYTHON_TOMLI_W_SETUP_TYPE = flit
 PYTHON_TOMLI_W_LICENSE = MIT
 PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
