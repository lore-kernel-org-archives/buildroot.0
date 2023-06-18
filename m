Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24BEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC7C60FCA;
	Sun, 18 Jun 2023 13:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC7C60FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQcVswSAAPbE; Sun, 18 Jun 2023 13:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0052610CC;
	Sun, 18 Jun 2023 13:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0052610CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3751BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 324D34024F
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 324D34024F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXWhBwIwJjBi for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:13:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13EB2401C9
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13EB2401C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F320D83D5D; Sun, 18 Jun 2023 13:13:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:10:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c94922beac62e66a993e0a6bc14567af4827d8d1
X-Git-Newrev: 962b1a702356595919e3b28dff7eb876d00c69e7
X-Patchwork-Hint: ignore
Message-Id: <20230618131313.F320D83D5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: bump to version
 0.14.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=962b1a702356595919e3b28dff7eb876d00c69e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 39af62e085..47b9009ea1 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  a5039d1a4d8d4bad784cb864927f83f8  pyphen-0.13.2.tar.gz
-sha256  847f57a043a58408f24670ae0184ff6edfb5fd5731743208228c028ddc514438  pyphen-0.13.2.tar.gz
+md5  19e799bbf459ac675698c37c5fae34a8  pyphen-0.14.0.tar.gz
+sha256  596c8b3be1c1a70411ba5f6517d9ccfe3083c758ae2b94a45f2707346d8e66fa  pyphen-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 9ca064c293..9baa2e7b98 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.13.2
+PYTHON_PYPHEN_VERSION = 0.14.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/46/12/aeb28a1e1a3f3cede967cea98ef3a1da844418ab8296a4bb9513f232736c
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/4b/52/46b119f94b3f68e4193ada36941606d8e26852b67bb6e099b0e310540b41
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
