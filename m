Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37CCC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6795F4EDF7;
	Mon, 20 Feb 2023 22:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6795F4EDF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LK1BFnRFRVoM; Mon, 20 Feb 2023 22:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2974EE2C;
	Mon, 20 Feb 2023 22:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2974EE2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D81271BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7388C416A5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7388C416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsWYV9-7woSP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B439E416AD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B439E416AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4F8786494; Mon, 20 Feb 2023 20:52:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:30:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cd7d4548cb434c2ed999ed62224d4aaad091c11b
X-Git-Newrev: b9b0bfbdfeb976bf047b9c6e346542159035395c
X-Patchwork-Hint: ignore
Message-Id: <20230220205203.A4F8786494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-texttable: bump
 to version 1.6.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9b0bfbdfeb976bf047b9c6e346542159035395c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index a769e91772..560749b238 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  15faadc07ba44d337cc1675ea6092a02  texttable-1.6.4.tar.gz
-sha256  42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9  texttable-1.6.4.tar.gz
+md5  83eb15fb541dd857ff051a8d0c979b9c  texttable-1.6.7.tar.gz
+sha256  290348fb67f7746931bcdfd55ac7584ecd4e5b0846ab164333f0794b121760f2  texttable-1.6.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 59df5f6ff5..c63fb5786c 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.4
+PYTHON_TEXTTABLE_VERSION = 1.6.7
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/d5/78/dbc2a5eab57a01fedaf975f2c16f04e76f09336dbeadb9994258aa0a2b1a
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/e4/84/4686ee611bb020038375c5f11fe7b6b3bb94ee78614a1faba45effe51591
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
