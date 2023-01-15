Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34568C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEBCD4F472;
	Tue, 21 Feb 2023 00:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBCD4F472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id morU42eRFfWz; Tue, 21 Feb 2023 00:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 973D64F4B9;
	Tue, 21 Feb 2023 00:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973D64F4B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 079B71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC35F6FB8B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC35F6FB8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pB0_1g2AeSTw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E45296FB10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45296FB10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B728648F; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:01:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5a1a38c8975153838f4e3f43ea03820613e4882
X-Git-Newrev: 64848d5dcddad89dd0b151282d3b5060d96dffaf
X-Patchwork-Hint: ignore
Message-Id: <20230220205234.D9B728648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pillow: bump to
 version 9.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=64848d5dcddad89dd0b151282d3b5060d96dffaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/python-pillow/Pillow/commit/13306974e749871822dac413be66e699a0f4645e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 46da25dddc..d514bdfe56 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a6507c1e811a51071d2d6de83070e703  Pillow-9.3.0.tar.gz
-sha256  c935a22a557a560108d780f9a0fc426dd7459940dc54faa49d83249c8d3e760f  Pillow-9.3.0.tar.gz
+md5  ee6e9a6c729ed9e9a78ccd3f6e9d7143  Pillow-9.4.0.tar.gz
+sha256  a1c2d7780448eb93fbcc3789bf3916aa5720d942e37945f4056680317f1cd23e  Pillow-9.4.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
+sha256  4e1755595052d843e2f350c930759f945ecf707bf812883948d181016b12dd0f  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 5ea9fcf264..c02968610f 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/16/11/da8d395299ca166aa56d9436e26fe8440e5443471de16ccd9a1d06f5993a
+PYTHON_PILLOW_VERSION = 9.4.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/bc/07/830784e061fb94d67649f3e438ff63cfb902dec6d48ac75aeaaac7c7c30e
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
