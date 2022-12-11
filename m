Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C766C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9FA813A0;
	Sun, 11 Dec 2022 08:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9FA813A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoGyRVuBucN4; Sun, 11 Dec 2022 08:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B1F813C1;
	Sun, 11 Dec 2022 08:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B1F813C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2141BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A5E9409A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A5E9409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAKwHhmNesCe for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCC7640925
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC7640925
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBDF185FAA; Sun, 11 Dec 2022 08:55:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d068bf4c4fce1eb376711940fb02a017815127e
X-Git-Newrev: eff0a0852830e05d2ed79dd8c744afff7d126002
X-Patchwork-Hint: ignore
Message-Id: <20221211085514.BBDF185FAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump to version 5.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=eff0a0852830e05d2ed79dd8c744afff7d126002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 6098273aa1..70c35ca864 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  358b18e2a96ab96945e33417d5c8cb31  cbor2-5.4.3.tar.gz
-sha256  62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2  cbor2-5.4.3.tar.gz
+md5  74512376482be8a6af10596a63b6d254  cbor2-5.4.6.tar.gz
+sha256  b893500db0fe033e570c3adc956af6eefc57e280026bd2d86fd53da9f1e594d7  cbor2-5.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 743ae4ef6f..a2fcd73b74 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.3
+PYTHON_CBOR2_VERSION = 5.4.6
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9d/c9/cfa5c35a62642a19c14bf9a12dfbf0ee134466be1f062df2258a2ec2f2f7
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/69/de486293f5211d2e8fe1a19854e69f2811a18448162c52b48c67f8fbcac3
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
