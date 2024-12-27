Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4527EE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163D580B92;
	Fri, 27 Dec 2024 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLLMidoI1BvI; Fri, 27 Dec 2024 14:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C47080D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C47080D72;
	Fri, 27 Dec 2024 14:31:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A61F1C
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725EA403C8
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EevZZZsV0Vll for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A16E4045D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A16E4045D
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 438748751E; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:09:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08e430e20be12ee1262ddb47353f8411612c0a89
X-Git-Newrev: 3839f06326068e740d28677bf5a3242cfdd3d60e
X-Patchwork-Hint: ignore
Message-Id: <20241227143125.438748751E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-attrs: bump to version
 24.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3839f06326068e740d28677bf5a3242cfdd3d60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 5cd15dbed7..ae13fbb552 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  031a41b703d7fc47ec204d0369b68dcd  attrs-24.2.0.tar.gz
-sha256  5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346  attrs-24.2.0.tar.gz
+md5  85dc1d9cca54e0986f429bfd1f2a4987  attrs-24.3.0.tar.gz
+sha256  8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff  attrs-24.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index c0725cf847..97b72df6dd 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 24.2.0
+PYTHON_ATTRS_VERSION = 24.3.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/48/c8/6260f8ccc11f0917360fc0da435c5c9c7504e3db174d5a12a1494887b045
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
