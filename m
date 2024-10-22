Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA68CDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CEA606F2;
	Tue, 22 Oct 2024 19:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1lKPDsXpxvb; Tue, 22 Oct 2024 19:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E6C607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E6C607AD;
	Tue, 22 Oct 2024 19:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE31F963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B86401CF
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzdL5X2P-s-J for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277CE40207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277CE40207
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22B4E861A1; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 21:11:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba7bc88687903c9b51a3fa659d0d08a8d9581369
X-Git-Newrev: 3b1c20a8167be3323ff33ecd4b3f6bcf93a9ad63
X-Patchwork-Hint: ignore
Message-Id: <20241022191654.22B4E861A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 0.39.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b1c20a8167be3323ff33ecd4b3f6bcf93a9ad63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index ea5cb4799e..9a9671f41c 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  e2e61f4def1d357e73795c646bda57e8  starlette-0.38.5.tar.gz
-sha256  04a92830a9b6eb1442c766199d62260c3d4dc9c4f9188360626b1e0273cb7077  starlette-0.38.5.tar.gz
+md5  cdef39e4684305e568bd91b45ceb9dbf  starlette-0.39.2.tar.gz
+sha256  caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a  starlette-0.39.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index bce75a1957..57d6e319f8 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.38.5
+PYTHON_STARLETTE_VERSION = 0.39.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/13/aa/57975da16ca0c368bbb5687daa6ad79561c2328a44667a1d6802e94df3e5
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/02/0a/62fbd5697f6174041f9b4e2e377b6f383f9189b77dbb7d73d24624caca1d
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
