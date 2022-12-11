Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF21EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8050C40981;
	Sun, 11 Dec 2022 08:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8050C40981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSsN269KwyaY; Sun, 11 Dec 2022 08:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BB04093E;
	Sun, 11 Dec 2022 08:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BB04093E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2E61BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D6C81369
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D6C81369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MPxqbVgb-Xi for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A46F881377
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A46F881377
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2BCE85FAD; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90817e547c54a26e6554819a545f6ef059ee479b
X-Git-Newrev: e8a8ed95901a663fff43217b7c73530eff25d757
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.A2BCE85FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: bump to version
 0.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8a8ed95901a663fff43217b7c73530eff25d757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 3a145e0f81..39af62e085 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  a2d6f69468684bbaa88d004b79c02128  pyphen-0.13.0.tar.gz
-sha256  06873cebffd65a8fca7c20c0e3dc032655c7ee8de0f552205cad3b574265c293  pyphen-0.13.0.tar.gz
+md5  a5039d1a4d8d4bad784cb864927f83f8  pyphen-0.13.2.tar.gz
+sha256  847f57a043a58408f24670ae0184ff6edfb5fd5731743208228c028ddc514438  pyphen-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index d83eb79736..9ca064c293 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.13.0
+PYTHON_PYPHEN_VERSION = 0.13.2
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/53/e7f212c87f91aab928bbf0de95ebc319c4d935e59bd5ed868f2c2bfc9465
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/46/12/aeb28a1e1a3f3cede967cea98ef3a1da844418ab8296a4bb9513f232736c
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
