Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076F7C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77BE418C2;
	Mon,  4 Dec 2023 20:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77BE418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1snY1jNAlte; Mon,  4 Dec 2023 20:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E76417DE;
	Mon,  4 Dec 2023 20:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E76417DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14E741BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF05F41765
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF05F41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQ7Ll3gvCozv for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF1E41749
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF1E41749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45F46879BA; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:25:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35744a2c0265d88f1264629f041e1676a0e99f32
X-Git-Newrev: 96980b4738c5adada09e39abac4c3087954cf1ce
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.45F46879BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 10.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=96980b4738c5adada09e39abac4c3087954cf1ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index c2c5125678..92258a6712 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.1.tar.gz
-sha256  d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d  Pillow-10.0.1.tar.gz
+md5  a55618c5d2fd64048dd3ea41bc39f7cd  Pillow-10.1.0.tar.gz
+sha256  e6bf8de6c36ed96c86ea3b6e1d5273c53f46ef518a062464cd7ef5dd2cf92e38  Pillow-10.1.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index d9f6fba861..bc94062da8 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.0.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421
+PYTHON_PILLOW_VERSION = 10.1.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/80/d7/c4b258c9098b469c4a4e77b0a99b5f4fd21e359c2e486c977d231f52fc71
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
