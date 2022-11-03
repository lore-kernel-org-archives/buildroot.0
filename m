Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47A9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B67C81FC2;
	Thu,  3 Nov 2022 21:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B67C81FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnncAIERYPXH; Thu,  3 Nov 2022 21:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 777BA81FAE;
	Thu,  3 Nov 2022 21:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777BA81FAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D77F1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0124140C2C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0124140C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXXaBaPiGupD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C325840BDC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C325840BDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0A0B87BCD; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3cbc054f7f560a058c0b380bcf650a15dcd25a18
X-Git-Newrev: ed582011f9a467dc044e05ed306b31bd10996eb8
X-Patchwork-Hint: ignore
Message-Id: <20221103205514.C0A0B87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sqlparse: bump
 to version 0.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed582011f9a467dc044e05ed306b31bd10996eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index d7e329eda2..c78fd2edc3 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  2ce34181d6b7b234c9f3c0ecd1ffb93e  sqlparse-0.3.0.tar.gz
-sha256  7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873  sqlparse-0.3.0.tar.gz
+md5  180fb4e11a3f79b119868d7c102d7816  sqlparse-0.4.3.tar.gz
+sha256  69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268  sqlparse-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 22111dfc41..23b1338e49 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.3.0
+PYTHON_SQLPARSE_VERSION = 0.4.3
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/63/c8/229dfd2d18663b375975d953e2bdc06d0eed714f93dcb7732f39e349c438
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b69f3a34b8867877e4dbf2a37b7f2a5c0bbb5a9eed64efd1ad1
 PYTHON_SQLPARSE_SETUP_TYPE = setuptools
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
